# SerenyaDyadev_infra
SerenyaDyadev Infra repository

bastion_IP = 51.250.4.93
someinternalhost_IP = 10.128.0.19

## ssh jump
ssh -i ~/.ssh/appuser -A -J appuser@51.250.4.93 appuser@10.128.0.19

## прописываем в ~/.ssh/config
Host bastion
  HostName 51.250.4.93
  User appuser
  IdentityFile ~/.ssh/appuser
  IdentitiesOnly yes

Host someinternalhost
  HostName 10.128.0.19
  ProxyJump bastion
  User appuser
  IdentityFile ~/.ssh/appuser
  IdentitiesOnly yes

и одно командой
 -> ssh someinternalhost
попадаем на someinternalhost

testapp_IP = 62.84.116.217
testapp_port = 9292
