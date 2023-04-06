### Backend ###
# S3
###############

terraform {
  backend "s3" {
    bucket = "khatrig-githubaction"
    key = "api-gateway-new.tfstate"
    region = "us-east-1"
  }
}
