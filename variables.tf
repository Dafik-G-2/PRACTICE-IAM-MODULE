variable "role_name" {
  type = string
  default = ""
  description = "give the role name"
}
variable "policy_name" {
  type = string
  default = ""
  description = "policy name to be attached"
}
variable "s3-bucket-name" {
  type = string
  default = ""
  description = "bucket name to get obects in it"
}
variable "environment" {
  type = string
  default = ""
}
