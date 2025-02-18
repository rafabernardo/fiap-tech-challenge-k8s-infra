resource "kubernetes_deployment" "user_service_api" {
  metadata {
    name = "user-service-api"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "user-service-api"
      }
    }
    template {
      metadata {
        labels = {
          app = "user-service-api"
        }
      }
      spec {
        container {
          image             = "${var.api_image}:latest"
          name              = "user-service-api-container"
          command           = ["sh", "-c", "./scripts/api.sh"]
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
            name  = "SECRET_KEY"
            value = "your-secret-key"
          }
          env {
            name  = "ALGORITHM"
            value = "HS256"
          }
          env {
            name  = "ACCESS_TOKEN_EXPIRE_MINUTES"
            value = "60"
          }
          env {
            name  = "POSTGRES_HOST"
            value = var.db_url
          }
          env {
            name  = "POSTGRES_USER"
            value = jsondecode(data.aws_secretsmanager_secret_version.db.secret_string)["db-username"]
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = jsondecode(data.aws_secretsmanager_secret_version.db.secret_string)["db-password"]
          }
          env {
            name  = "POSTGRES_DB"
            value = var.db_db_name
          }
        }
      }
    }
  }
}

