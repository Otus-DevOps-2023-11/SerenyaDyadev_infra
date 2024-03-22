// создание целевой группы
resource "yandex_alb_target_group" "target-group" {
  name = "target-group-test"

  target {
    subnet_id = var.subnet_id
    # ip_address   = yandex_compute_instance.app[0].network_interface.0.nat_ip_address
    ip_address = yandex_compute_instance.app[0].network_interface.0.ip_address
  }

  target {
    subnet_id  = var.subnet_id
    ip_address = yandex_compute_instance.app[1].network_interface.0.ip_address
  }
}

// создание группы бекендеров
resource "yandex_alb_backend_group" "backend-group" {
  name = "backend-group-test"
  session_affinity {
    connection {
      source_ip = true
    }
  }

  http_backend {
    name             = "app-1"
    weight           = 1
    port             = 9292
    target_group_ids = [yandex_alb_target_group.target-group.id]
    load_balancing_config {
      panic_threshold = 90
    }
    healthcheck {
      timeout             = "10s"
      interval            = "2s"
      healthy_threshold   = 10
      unhealthy_threshold = 15
      http_healthcheck {
        path = "/"
      }
    }
  }
}

resource "yandex_alb_http_router" "http-router" {
  name = "http-router-test"
  labels = {
    tf-label    = "tf-label-value"
    empty-label = ""
  }
}

resource "yandex_alb_virtual_host" "my-virtual-host" {
  name           = "my-virtual-host"
  http_router_id = yandex_alb_http_router.http-router.id
  route {
    name = "to-app"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.backend-group.id
        timeout          = "60s"
      }
    }
  }
}

resource "yandex_alb_load_balancer" "lb" {
  name               = "reddit-app-lb"
  network_id         = var.network_id
  security_group_ids = ["enpqeslt7lb8s22crrnr"]

  allocation_policy {
    location {
      zone_id   = var.zone
      subnet_id = var.subnet_id
    }
  }

  listener {
    name = "reddir-app-listener"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [9292]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.http-router.id
      }
    }
  }
}