variable "my-test" {
  type    = number
  default = 123
}

variable "my-map" {
  type = map(any)
  default = {
    "key1" = "value1"
    "key2" = "value2"
  }
}

variable "my-list" {
  type = list(any)
  default = [
    "value1",
    "value2"
  ]
}

output "my-test" {
  value = {
    value1 = var.my-map["key1"]
    value2 = var.my-list[0]
  }
}

variable "environment" {
  type    = string
  default = "dev"
}

output "conditional-test-output" {
  value = var.environment == "dev" ? "Development Environment" : "Production Environment"
}

data "local_file" "local_file_example" {
  filename = "${path.module}/test-vars.tf"
}

output "file-content" {
  value = data.local_file.local_file_example.content
}