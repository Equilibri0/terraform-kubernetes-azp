#Kubernetes Azure Devops Agent Module
resource "kubernetes_deployment" "azp-agent" {
  metadata {
    name      = var.name
    namespace = var.namespace
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = var.name
      }
    }

    template {
      metadata {
        labels = {
          app = var.name
        }
      }

      spec {
        container {
          image = var.container_image
          name  = var.name

          resources {
            limits {
              cpu    = var.container_resource_limits_cpu
              memory = var.container_resource_limits_memory
            }
            requests {
              cpu    = var.container_resource_requests_cpu
              memory = var.container_resource_requests_memory
            }
          }
          env {
            name  = "AZP_URL"
            value = var.azp_url
          }
          env {
            name = "AZP_TOKEN"
            value_from {
              secret_key_ref {
                name = var.k8s_secret_key_name
                key  = "AZP_TOKEN"
              }
            }
          }
          env {
            name  = "AZP_POOL"
            value = var.azp_pool
          }
          volume_mount {
            mount_path = "/var/run/docker.sock"
            name       = "docker-volume"
          }
        }
        volume {
          name = "docker-volume"
          host_path {
            path = "/var/run/docker.sock"
          }
        }
      }
    }
  }
}

