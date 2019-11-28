Create custom Azure DevOps Pipeline Agents
==============================================================================

This Terraform module deploys a Azure DevOps Pipelines Agent in your kubernetes: 

- Creates agent pods inside of Kubernetes


Usage
-----

```hcl 
module "azp-agent" { 
    source                             = "../modules/terraform-kubernetes-azp"
    name                               = "azp-agent"
    replicas                           = 1
    namespace                          = "default"
    container_image                    = "registry.gitlab.com/equilibri0/docker-azp-agent/docker-azp-agent:latest"
    container_resource_limits_cpu      = "0.5"
    container_resource_limits_memory   = "512Mi"
    container_resource_requests_cpu    = "250m"
    container_resource_requests_memory = "50Mi"
    azp_url                            = "https://dev.azure.com/YOUR_ORGANIZATION"
    azp_pool                           = "Default"
    k8s_secret_key_name                = "azp-sec"
}

```


Authors
=======
Originally created by [Pana T.](http://github.com/Equilibri0)
