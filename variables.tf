variable "name" {
  description = "Name of the agent"
  default = "azp-agent"
}

variable "replicas" {
  description = "The number of pod replicas"
  default     = 1
}

variable "namespace" {
  description = "Name of the namespace which will be used"
  default = "default"
}

variable "container_image" {
  description = "Name of the namespace which will be used"
  default = "registry.gitlab.com/equilibri0/docker-azp-agent/docker-azp-agent:latest"
}

variable "container_resource_limits_cpu" {
  description = "Container limits CPU"
  default = "0.5"
}

variable "container_resource_limits_memory" {
  description = "Container limits Memory"
  default = "512Mi"
}

variable "container_resource_requests_cpu" {
  description = "Container requests CPU"
  default = "250m"
}

variable "container_resource_requests_memory" {
  description = "Container requests Memory"
  default = "50Mi"
}

variable "azp_url" {
  description = "Azure Devops URL"
  default = "https://dev.azure.com/YOUR_ORGANIZATION"
}

variable "azp_pool" {
  description = "Azure Devops Agent pool which will be used"
  default = "Default"
}

variable "k8s_secret_key_name" {
  description = "Kubernetes Secret Key which is providing the token"
  default = "azp-sec"
}