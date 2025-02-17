resource "kubernetes_service" "product_service_lb" {
  metadata {
    name = "product-service-lb"
  }

  spec {
    selector = {
      app = "product-service-api"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
