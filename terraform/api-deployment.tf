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
        restart_policy = "Always"
        container {
          image   = var.apiImage
          name    = "api-deployment"
          command = ["sh", "-c", "./scripts/api.sh"]


          resources {
            limits = {
              cpu    = "1"
              memory = "512Mi"
            }
            requests = {
              cpu    = "500m"
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
            value = data.terraform_remote_state.rds.outputs.url
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
            value = data.terraform_remote_state.rds.outputs.db-name
          }
        }
      }
    }
  }
}

