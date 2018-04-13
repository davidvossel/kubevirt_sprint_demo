#!/bin/bash

# this script sync images to docker repo

HUB="docker.io"
ORG="mutism"
TAG="demo"
IMAGES="ansibleplaybookbundle/kubevirt-apb jniederm/origin-web-console:demo-v4 ansibleplaybookbundle/mssql-apb:latest docker.io/ansibleplaybookbundle/kubevirt-apb:latest kubevirt/virt-api:v0.4.1-alpha.1 kubevirt/virt-controller:v0.4.1-alpha.1 kubevirt/virt-handler:v0.4.1-alpha.1 kubevirt/virt-launcher:v0.4.1-alpha.1 gluster/heketiclone:latest jcoperh/importer:latest ansibleplaybookbundle/import-vm-disk-apb:latest"
for image in $IMAGES ; do
  echo "Processing $image"
  id=`docker images $image -q`
  name=`echo $image | cut -d'/' -f2 | cut -d':' -f1`
  docker tag $id $HUB/$ORG/$name:$TAG
  docker push $HUB/$ORG/$name:$TAG
  echo "------------------------------"
done
