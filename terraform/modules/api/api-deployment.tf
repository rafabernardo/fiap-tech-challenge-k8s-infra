resource "kubernetes_deployment" "api-deployment" {
  metadata {
    name = "api-deployment"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "api-deployment"
      }
    }
    template {
      metadata {
        labels = {
          app = "api-deployment"
        }
      }
      spec {
        container {
          image   = var.api_image
          name    = "api-deployment"
          command = ["sh", "-c", "./scripts/api.sh"]


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
            name  = "POSTGRESQL_URL"
            value = var.db_url
          }
          env {
            name  = "POSTGRESQL_USERNAME"
            value = jsondecode(data.aws_secretsmanager_secret_version.db.secret_string)["db-username"]
          }
          env {
            name  = "POSTGRESQL_PASSWORD"
            value = jsondecode(data.aws_secretsmanager_secret_version.db.secret_string)["db-password"]
          }
          env {
            name  = "POSTGRESQL_DATABASE"
            value = var.db_db_name
          }
        }
      }
    }
  }
}

