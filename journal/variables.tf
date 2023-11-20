variable "user_uuid" {
  type        = string
  description = "The Uuid of the user"

  validation {
    condition     = can(regex("^([a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12})$", var.user_uuid))
    error_message = "Invalid UUID format. Please provide a valid UUID."
  }
}