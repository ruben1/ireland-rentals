variable "app_name" {
  type        = string
  description = "Redshift Serverless Namespace Name"
  default     = "ireland-rentals"
}

variable "app_environment" {
  type        = string
  description = "Redshift Serverless Namespace Name"
  default     = "production"
}

variable "redshift_serverless_namespace_name" {
  type        = string
  description = "Redshift Serverless Namespace Name"
  default     = "ireland-rentals"
}

variable "redshift_serverless_database_name" { 
  type        = string
  description = "Redshift Serverless Database Name"
  default     = "ireland-rentals"
}

variable "redshift_serverless_admin_username" {
  type        = string
  description = "Redshift Serverless Admin Username"
}

variable "redshift_serverless_admin_password" { 
  type        = string
  description = "Redshift Serverless Admin Password"
}

variable "redshift_serverless_workgroup_name" {
  type        = string
  description = "Redshift Serverless Workgroup Name"
  default     = "ireland-rentals"
}

variable "redshift_serverless_base_capacity" {
  type        = number
  description = "Redshift Serverless Base Capacity"
  default     = 8
}

variable "redshift_serverless_publicly_accessible" {
  type        = bool
  description = "Set the Redshift Serverless to be Publicly Accessible"
  default     = false 
}

variable "metabase_db_user" {
  type = string
}

variable "metabase_db_password" {
  type = string
}