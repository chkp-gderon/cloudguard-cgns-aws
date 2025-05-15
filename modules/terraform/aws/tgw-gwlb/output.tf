output "Deployment" {
  value = "Finalizing instances configuration may take up to 20 minutes after deployment is finished."
}
output "management_public_ip" {
  depends_on = [module.gwlb]
  value = module.gwlb[*].management_public_ip
}
output "gwlb_arn" {
  depends_on = [module.gwlb]
  value = module.gwlb[*].gwlb_arn
}
output "gwlb_service_name" {
  depends_on = [module.gwlb]
  value = module.gwlb[*].gwlb_service_name
}
output "gwlb_name" {
  value = var.gateway_load_balancer_name
}
output "controller_name" {
  value = "gwlb-controller"
}
output "template_name" {
  value = var.configuration_template
}
output "gwlbe1a_id" {
  value = aws_vpc_endpoint.gwlb_endpoint1.id
}
output "gwlbe1b_id" {
  value = aws_vpc_endpoint.gwlb_endpoint2.id
}