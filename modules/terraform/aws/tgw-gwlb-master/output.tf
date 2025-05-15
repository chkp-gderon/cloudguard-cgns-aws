output "Deployment" {
  value = "Finalizing instances configuration may take up to 20 minutes after deployment is finished."
}
output "management_public_ip" {
  depends_on = [module.tgw-gwlb]
  value = module.tgw-gwlb[*].management_public_ip
}
output "gwlb_arn" {
  depends_on = [module.tgw-gwlb]
  value = module.tgw-gwlb[*].gwlb_arn
}
output "gwlb_service_name" {
  depends_on = [module.tgw-gwlb]
  value = module.tgw-gwlb[*].gwlb_service_name
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
output "tgw_subnets_ids_list" {
   value = module.launch_vpc.tgw_subnets_ids_list
}
output "vpc_id" {
  value = module.launch_vpc.vpc_id
}
output "gwlbe1a_id" {
  value = module.tgw-gwlb.gwlbe1a_id
}
output "gwlbe1b_id" {
  value = module.tgw-gwlb.gwlbe1b_id
}