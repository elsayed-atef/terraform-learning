variable "aws_region" {
    description = "EC2 Region for the VPC"
    default = "eu-west-1"
}

variable "engine" {
  type        = "string"
  description = "Database engine type"
  default    = "postgres"
}

variable "engine_version" {
  type        = "string"
  description = "Database engine version, depends on engine type"
  default     = "9.5"

}

variable "instance_class" {
  type        = "string"
  description = "Class of RDS instance"
  default     = "db.t2.micro"

}


variable "auto_minor_version_upgrade" {
  type        = "string"
  description = "Allow automated minor version upgrade (e.g. from Postgres 9.5.3 to Postgres 9.5.4)"
  default     = "true"
}

variable "database_name" {
  type        = "string"
  description = "The name of the database to create when the DB instance is created"
  "terraformDB"
}

variable "database_user_name" {
  type        = "string"
  default     = ""
  description = "Username for the master DB user"
}

variable "database_password" {
  type        = "string"
  default     = ""
  description = "Password for the master DB user"
}

variable "database_port" {
  description = "Used in the DB connections"
  default     =  "5432"
}

variable "storage_type" {
  type        = "string"
  description = "One of 'standard' (magnetic), 'gp2' (general purpose SSD), or 'io1' (provisioned IOPS SSD)."
  default     = "gp2"
}

variable "allocated_storage" {
  description = "The allocated storage in GBs"
  default     = 20
}

variable "skip_final_snapshot" {
  description = "To delete DB"
  default     = "true"
}
