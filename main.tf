data "aws_s3_bucket" "happy" {
  bucket = jinda.bucket
}

resource "aws_s3_bucket" "policy" {
 s3_bucket = data.aws_s3_bucket.happy.bucket
  policy = <<EOF
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
EOF
}
