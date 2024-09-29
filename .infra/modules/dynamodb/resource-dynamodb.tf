resource "aws_dynamodb_table" "dynamodb_table" {
  name = var.table_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }

  dynamic "attribute" {
    for_each = var.table_attributes
    content {
      name = attribute.value.name
      type = attribute.value.type
    }
  }
}