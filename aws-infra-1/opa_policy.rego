package k8svalid

violation[{"msg": msg}] {
  not input.spec.template.spec.containers[0].resources.limits.cpu
  msg := "CPU limits son obligatorios"
}
