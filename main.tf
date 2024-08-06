variable "users" {
    description = "creation of multi users using set string"
    type = set(string)
    default = ["user1","user2","user2"]
}

resource "aws_iam_user" "multi-user" {
    for_each = var.users
    name = each.value
}
