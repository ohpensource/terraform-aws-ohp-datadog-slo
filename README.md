# terraform-aws-ohp-datadog-slo
Terraform module to create service level objectives (SLOs)

```terraform
module "slo_dashboard" {
  providers = {
    datadog = datadog
  }

  source = "git::https://github.com/ohpensource/terraform-datadog-ohp-slo?ref=v0.1.0"

  api_id      = local.api_id
  name        = "your api default name"
  description = "your api default description"
  thresholds  = [{
      timeframe = "7d"
      target    = 99.9
      warning   = 99.99
    }]

  tags = ["api_id:${local.api_id}", "api_name:${local.api_name}"]
}

```