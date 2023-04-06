module "example_api_gateway" {
  source = "./modules/api-gateway"

  name        = "example-api"
  description = "Example API Gateway REST API"

  resources = {
    "test" = {
      #parent_id = aws_api_gateway_rest_api.example_api.root_resource1_id
      #resource_name = "resource1"
      #parent_id = "module.example_api_gateway.root_resource_id"
      path_part = "resource1"
    }
    "prod" = {
      #parent_id = aws_api_gateway_resource.example_resource["resource1"].id
      #parent_id = aws_api_gateway_resource.example_api.root_resource2.id 
      #resource_name = "resource2"
      #parent_id = "module.example_api_gateway.root_resource_id"
      path_part = "resource2"
    }
  }

  methods = {
    "method1" = {
      resource_name = "resource1"
      http_method   = "POST"
      authorization = "NONE"
    }
    "method2" = {
      resource_name = "resource2"
      http_method   = "POST"
      authorization = "NONE"
    }
  }
}
