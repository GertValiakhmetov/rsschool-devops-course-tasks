variable "table_name" {
  description = "Name of the DynamoDB table"
  type = string
}

variable "hash_key" {
  description = "Hash key of the DynamoDB table"
  type = string
}

variable "table_attributes" {
  description = "List of DynamoDB table's attributes"
  type = list(object({
    name = string
    type = string
  }))
  default = []
}