resource "aws_s3_bucket" "noS3BucketSseRules" {
  bucket = "mybucket"
  acl    = "private"

  tags = {
    Name        = "nos3BucketSseRules"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_policy" "noS3BucketSseRulespolicy" {
  bucket = aws_s3_bucket.noS3BucketSseRules.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "noS3BucketSseRules-restrict-access-to-users-or-roles",
      "Effect": "Allow",
      "Principal": [
        {
          "AWS": [
            "<aws_policy_role_arn>"
          ]
        }
      ],
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::noS3BucketSseRules/*"
    }
  ]
}
POLICY
}