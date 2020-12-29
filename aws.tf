resource "aws_s3_bucket" "happy" {
  bucket = "protesqbucket"
}

resource "aws_s3_bucket_policy" "mypolicy" {
  bucket = aws_s3_bucket.happy.id

  policy = <<POLICY
{
	"Version": "2012-10-17",
	"Statement": [{
		"Sid": "S3Put",
		"Effect": "Allow",
    "Principal": "*",
		"Action": "s3:PutObject",
		"Resource": "arn:aws:s3:::protesqbucket/*"
	}]
}   
POLICY
}
