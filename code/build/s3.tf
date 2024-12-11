provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "dev_s3" {
  bucket_prefix = "dev-"

  tags = {
    Environment          = "Dev"
    yor_name             = "dev_s3"
    yor_trace            = "a25eaf55-9287-4a87-a274-7ef999db9615"
    git_commit           = "053b2b9f56232cde5f423783dd35d8ce8935272f"
    git_file             = "code/build/s3.tf"
    git_last_modified_at = "2024-12-11 17:31:36"
    git_last_modified_by = "steve@buzonas.dev"
    git_modifiers        = "steve"
    git_org              = "sbuzonas"
    git_repo             = "prisma-cloud-devsecops-workshop"
  }
}

resource "aws_s3_bucket_ownership_controls" "dev_s3" {
  bucket = aws_s3_bucket.dev_s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}
