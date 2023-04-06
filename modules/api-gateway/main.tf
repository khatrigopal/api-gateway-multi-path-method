resource "aws_api_gateway_rest_api" "example_api" {
  name        = var.name
  description = var.description
}

resource "aws_api_gateway_resource" "example_resource" {
  for_each = var.resources

  rest_api_id = aws_api_gateway_rest_api.example_api.id
  #parent_id   = each.value.parent_id
  parent_id = aws_api_gateway_rest_api.resource[each.value.resource_name].id
  path_part   = each.value.path_part
}

resource "aws_api_gateway_method" "example_method" {
  for_each = var.methods

  rest_api_id   = aws_api_gateway_rest_api.example_api.id
  resource_id   = aws_api_gateway_resource.example_resource[each.value.resource_name].id
  http_method   = each.value.http_method
  authorization = each.value.authorization
}
