resource "kubernetes_job" "run_shell_script" {
  metadata {
    name      = "run-script-job"
  }

  spec {
    template {
      metadata {
        labels = {
          app = "run-script-job"
        }
      }

      spec {
        container {
          name  = "run-script"
          image = var.apiImage

          command = ["/bin/sh", "-c", "./scripts/alembic-upgrade.sh"]

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
        }

        restart_policy = "OnFailure"
      }
    }

    backoff_limit = 4
  }
}
