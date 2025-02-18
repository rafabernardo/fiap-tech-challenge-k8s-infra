resource "kubernetes_deployment" "product_service_api" {
  metadata {
    name = "product-service-api"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "product-service-api"
      }
    }
    template {
      metadata {
        labels = {
          app = "product-service-api"
        }
      }
      spec {
        container {
          image             = "${var.api_image}:latest"
          name              = "product-service-api-container"
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
            value = var.db_url
          }
          env {
            name  = "AUTHENTICATION_URL"
            value = var.user_service_url
          }
          env {
            name  = "API_URL"
            value = "http://product-service-lb"
          }
          env {
            name  = "PAYMENT_URL"
            value = var.payment_service_url
          }
        }
      }
    }
  }
}


