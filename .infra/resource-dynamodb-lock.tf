module "dynamodb" {
  source = "./modules/dynamodb"

  hash_key   = "LockID"
  table_name = "dynamodb-lock"
}