# TODO: return a map of {ou_name,ou_id} instead, so we can support multiple OUs
# creation without breaking the interface
output "ou_id" {
  value = aws_organizations_organizational_unit.my_ou.id
}
