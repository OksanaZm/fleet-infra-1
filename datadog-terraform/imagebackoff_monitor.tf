resource "datadog_monitor" "image_pull_backoff" {
  name    = "Kubernetes ImagePullBackOff"
  type    = "query alert"
  query   = <<EOT
avg(last_5m):max:kubernetes_state.container.waiting{reason:ImagePullBackOff} by {pod} > 0
EOT

  message  = "ImagePullBackOff detected on pod {{pod.name}}"
  priority = 3
  tags     = ["k8s", "image", "alert"]

  monitor_thresholds {
    critical = 0
  }
}