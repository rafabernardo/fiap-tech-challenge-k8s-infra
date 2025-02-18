resource "kubernetes_deployment" "payment_service_api" {
  metadata {
    name = "payment-service-api"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "payment-service-api"
      }
    }
    template {
      metadata {
        labels = {
          app = "payment-service-api"
        }
      }
      spec {
        container {
          image             = "${var.api_image}:latest"
          name              = "payment-service-api-container"
          image_pull_policy = "Always"


          resources {
            limits = {
              cpu    = "1500m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "1m"
              memory = "256Mi"
            }
          }

          port {
            container_port = 80
          }
          env {
            name  = "API_PORT"
            value = "80"
          }
          env {
            name  = "MONGO_DATABASE"
            value = "database_test"
          }
          env {
            name  = "MONGO_URI"
            value = var.db_url_payment
          }

        }
      }
    }
  }
}

