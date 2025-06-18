variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "instance_class" {
  type = string

  validation {
    condition = contains(["db.t3.micro"], var.instance_class)
    error_message = "Only db.t3.micro is allowed for instance_class."
  }
}

variable "storage_size" {
  type = number

  validation {
    condition = var.storage_size >= 5 && var.storage_size <= 10
    error_message = "The DB storage size must be greater than 5 GB and less than or equal to 10 GB."
  }
}

variable "engine" {
  type = string

  validation {
    condition = contains(["postgress-latest", postgress14], var.engine)
    error_message = "DB engine must be either 'postgress-latest' or 'postgress14'."
  }
}

variable "credentials" {
  type = object({
    username = string
    password = string
  })

  sensitive = true

  validation {
    condition = (
        length(regexall("[a-zA-Z0-9]+")) > 0 && length(regexall("[0-9]+")) > 0 && length(regexall("[a-zA-Z0-9]{6,}")) >= 6
    )
    error_message = "Password must contain atleast 1 character and 1 digit and be atleast 6 character be long."
  }
}