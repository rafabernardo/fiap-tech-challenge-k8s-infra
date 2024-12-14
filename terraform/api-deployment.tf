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
          image = var.apiImage
          name  = "api-deployment"
          command = ["sh", "-c", "./scripts/api.sh"]
          port {
            container_port = 80
          }
          env {
            name="API_PORT"
            value="80"
          }
          env {
            name="MONGO_URL"
            value="MONGO_URL"
          }
          env {
            name="MONGO_PORT"
            value="12345"
          }
          env {
            name="MONGO_USERNAME"
            value="MONGO_USERNAME"
          }
          env {
            name="MONGO_PASSWORD"
            value="MONGO_PASSWORD"
          }
          env {
            name="MONGO_DATABASE"
            value="MONGO_DATABASE"
          }
          env {
            name="POSTGRESQL_URI"
            value="postgresql://user:password@localhost:5432/postgres"
          }
          env {
            name="POSTGRESQL_URL"
            value="POSTGRESQL_URL"
          }
          env {
            name="POSTGRESQL_PORT"
            value="5432"
          }
          env {
            name="POSTGRESQL_USERNAME"
            value="POSTGRESQL_USERNAME"
          }
          env {
            name="POSTGRESQL_PASSWORD"
            value="POSTGRESQL_PASSWORD"
          }
          env {
            name="POSTGRESQL_DATABASE"
            value="POSTGRESQL_DATABASE"
          }
        }
      }
    }
  }
}

