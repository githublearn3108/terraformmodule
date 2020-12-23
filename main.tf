resource "aws_s3_bucket" "b" {
  bucket = "jinda.bucket"
}

resource "aws_s3_bucket_policy" "b" {
  bucket = aws_s3_bucket.b.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "S3Get",
        "Effect":"Allow",
        "Action": [
          "s3:GetObject"
        ],
        "Resource": [
          "arn:aws:s3:::jinda.bucket/*"
        ]
      }
  ]
}
POLICY
}
