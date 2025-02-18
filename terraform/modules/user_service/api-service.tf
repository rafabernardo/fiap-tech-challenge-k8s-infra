resource "kubernetes_service" "user_service_lb" {
  metadata {
    name = "user-service-lb"
  }

  spec {
    selector = {
      app = "user-service-api"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

output "url" {
  value = kubernetes_service.user_service_lb.status.0.load_balancer.0.ingress.0.hostname
}
