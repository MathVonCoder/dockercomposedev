# Terraform docker file to work with Azure

The image in this directory will allow devops to work with terraform and azure.

I've choosen ubuntu as a based image as I want to integrate microsoft [aztfexport](https://github.com/Azure/aztfexport) later on and it is officially only supported on ubuntu and not on bare debian.  
But moving those images from Ubuntu 22.04 to Debian should not be too hard.

## terraform ubuntu

I have splitted the docker file in two in case someone want a standalone ubuntu terraform image.
build it with: 
`docker build -t terraform-ubu:local.latest -f .\terraform-ubu.dockerfile .`

## terraform ubuntu azure cli aztfexport

`docker build -t terraform-ubu-az:local.latest -f .\terraform-ubu-az.dockerfile .`

you can us it with:
```
docker run -it -w /tfwork -v $PWD:/tfwork \
 -e ARM_SUBSCRIPTION_ID=$ARM_SUBSCRIPTION_ID \
 -e ARM_TENANT_ID=$ARM_TENANT_ID \
 -e ARM_CLIENT_ID=$ARM_CLIENT_ID \
 -e ARM_CLIENT_SECRET=$ARM_CLIENT_SECRET \
 -e ARM_ACCESS_KEY=$ARM_ACCESS_KEY  terraform-ubu-az:local.latest sh
 ```
 where /tfwork will be your current host directory.

 If you do not plan to use an Azure storage as a backend, you can remove the `ARM_ACCESS_KEY` env var.