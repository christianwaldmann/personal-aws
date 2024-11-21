
resource "aws_ssm_parameter" "this" {
  for_each = {
    for secret in local.secrets.secrets : secret.name => secret
  }

  name  = each.value.name
  value = try(each.value.generate_random, false) ? random_password.this[each.value.name].result : each.value.value
  type  = "SecureString"
}

resource "random_password" "this" {
  for_each = {
    for secret in local.secrets.secrets : secret.name => secret
    if try(secret.generate_random, false)
  }

  length      = 25
  special     = true
  min_special = 5
}
