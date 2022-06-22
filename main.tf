
resource "datadog_service_level_objective" "foo" {
  name        = var.name
  type        = "metric"
  description = var.description
  query {
    numerator   = "sum:aws.apigateway.count{apiid:${var.api_id}}.as_count() - sum:aws.apigateway.5xxerror{apiid:${var.api_id}}.as_count()"
    denominator = "sum:aws.apigateway.count{apiid:${var.api_id}}.as_count()"
  }

  dynamic "thresholds" {
    for_each = var.thresholds
    content {
      timeframe = thresholds.value.timeframe
      target    = thresholds.value.target
      warning   = thresholds.value.warning
    }
  }

  tags = var.tags
}
