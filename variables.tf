variable "api_id" {
  type = string
}

variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "thresholds" {
  type = list(object({
    timeframe = string
    target    = number
    warning   = number
  }))
}

variable "tags" {
  type        = list(any)
  description = "A list of datadog tags to associate with your SLO."
}
