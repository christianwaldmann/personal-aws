
resource "aws_s3_bucket" "this" {
    bucket = "hetzner-terraform-state"
    object_lock_enabled = true

    tags = {
        Name = "Remote Terraform State Store"
    }
}
