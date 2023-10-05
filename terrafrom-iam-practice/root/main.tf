
# create users and attach policies using iam module
module "user" {
    source            = "../modules/iam_users"
    count             = length(var.user_name_list)
    user_name         = var.user_name_list[count.index]
    attachment_name   = var.policy_attachment_name_list[count.index]
    attach_policy_arn = var.arn_policy_list[count.index]
}