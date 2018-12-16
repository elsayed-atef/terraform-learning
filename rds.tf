provider "aws" {
  region = "${var.aws_region}"

}

terraform {
  backend  "s3" {
    bucket         = "elsayed-terrafom"
    dynamodb_table = "terraform-state-lock"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = "true"
  }
}

resource "aws_dynamodb_table" "dynamodb-state-lock" {
  name           = "terraform-state-lock"
  hash_key       = "LockID"
  read_capacity  = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags {
    Name = "DynamoDB Terraform State Lock Table"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage           = "${var.allocated_storage}"
  storage_type                = "${var.storage_type}"
  engine                      = "${var.engine}"
  engine_version              = "${var.engine_version}"
  instance_class              = "${var.instance_class}"
  name                        = "${var.database_name}"
  username                    = "${var.database_user_name}"
  password                    = "${var.database_password}"
  auto_minor_version_upgrade  = "${var.auto_minor_version_upgrade}"
  skip_final_snapshot         = "${var.skip_final_snapshot}"
}
