variable "api_token" {
  type      = string
  sensitive = true
}

variable "ssh_port" {
  type      = number
  sensitive = true
  default = 22
}

variable "user_name" {
  type      = string
  sensitive = true
}