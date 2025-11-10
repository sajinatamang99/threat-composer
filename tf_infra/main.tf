# AWS Provider and Region Setup
provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {}
data "aws_region" "current" {}

module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr        = var.vpc_cidr
  vpc_name        = var.vpc_name
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  azs             = data.aws_availability_zones.available.names
}

module "dns" {
  source       = "./modules/dns"
  domain_name  = var.domain_name
  record_name  = var.record_name
  tags         = var.tags
  alb_dns_name = module.alb.alb_dns_name
  alb_zone_id  = module.alb.alb_zone_id
}

module "acm" {
  source          = "./modules/acm"
  domain_name     = var.domain_name
  record_name     = var.record_name
  project         = var.project
  tags            = var.tags
  route53_zone_id = module.dns.zone_id
}

module "alb" {
  source                = "./modules/alb"
  project               = var.project
  environment           = var.environment
  tags                  = var.tags
  vpc_id                = module.vpc.vpc_id
  public_subnets        = module.vpc.public_subnet_ids
  alb_security_group_id = module.vpc.alb_sg_id
  certificate_arn       = module.acm.certificate_arn
  depends_on            = [module.acm]
}

module "ecr" {
  source = "./modules/ecr"
}

module "ecs" {
  source             = "./modules/ecs"
  project            = var.project
  private_subnet_ids = module.vpc.private_subnet_ids
  ecs_sg_id          = module.vpc.ecs_sg_id
  target_group_arn   = module.alb.alb_target_group_arn
  alb_listener_arn   = module.alb.alb_listener_arn
  image_url          = module.ecr.repository_url
}
