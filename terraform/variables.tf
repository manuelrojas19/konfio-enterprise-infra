# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project Name"
  default     = "konfio-enterprise"
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  default     = "qa"
}

variable "ami" {
  description = "AMI"
  default     = "ami-0fe630eb857a6ec83"
}

variable "db_instance_type" {
  description = "Instance type for RDS"
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the database to be created on the RDS instance"
  type        = string
  default     = "enterprisedb"
}


variable "db_username" {
  description = "Database username"
  default     = "postgres"
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
}

variable "family" {
  description = "Database password"
  default   = "postgres15"
}

variable "zone_name" {
  description = "The name of the Route 53 hosted zone"
  type        = string
  default     = "konfio.enterprise.com"
}

variable "rds_record_name" {
  description = "The name of the Route 53 record for the RDS instance, to allow easy access from internal private subnet"
  type        = string
  default     = "query.rds.db.konfio.enterprise.com"
}

