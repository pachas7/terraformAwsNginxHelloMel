variable "aws_access_key" {
  type    = string
  default = ""
}

variable "aws_secret_key" {
  type    = string
  default = ""
}

variable "instance_type" {
  type    = string
  default = ""
}

variable "inbound_port" {
  type    = list(string)
  default = [""]
}