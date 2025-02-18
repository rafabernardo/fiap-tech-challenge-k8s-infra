resource "kubernetes_service" "payment_service_lb" {
  metadata {
    name = "payment-service-lb"
  }

  spec {
    selector = {
      app = "payment-service-api"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}

output "url" {
  value = kubernetes_service.payment_service_lb.status.0.load_balancer.0.ingress.0.hostname
}
