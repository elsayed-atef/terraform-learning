variable "key_name" {
  description = "keypair to ssh"
  default     = "terra"
}

variable "iam_instance_profile" {
  description = "iam profile to access s3"
  default     = "access-terraform"
}
