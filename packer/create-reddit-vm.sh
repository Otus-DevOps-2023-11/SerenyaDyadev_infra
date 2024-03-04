#!/bin/sh
yc compute instance create \
  --name reddit-full \
  --hostname reddit-full \
  --memory=2 \
  --create-boot-disk name=redditfulldisk,size=10GB,image-id=fd8lo9l90k1vesqpha0d \
  --public-ip \
  --ssh-key ~/.ssh/appuser.pub
