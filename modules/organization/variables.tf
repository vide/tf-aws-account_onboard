variable "ou_name" {
  description = "The name of the Organizational Unit."
  type        = string
  default     = "my-ou"
}

variable "permission_set_name" {
  description = "The name of the permission set."
  type        = string
  default     = "admin"
}

variable "identity_group" {
  description = "The main identity store group to use"
  type = object({
    name        = string,
    description = string
  })
}

variable "existing_org_id" {
  description = "The ID of the existing Organization created via the web console during root account bootstrap. Will be used to import it in the state."
  type        = string
  default     = null
}
