resource "datadog_monitor" "image_pull_backoff" {
  name    = "K8s ImagePullBackOff Alert"
  type    = "query alert"
  query   = <<EOT
avg(last_5m):max:kubernetes_state.container.waiting{reason:ImagePullBackOff} by {kube_container_name} > 0
EOT

  message  = "ImagePullBackOff detected on container {{kube_container_name.name}}"
  tags     = ["k8s", "imagepullbackoff"]
  priority = 3

  thresholds {
    critical = 1
  }
}