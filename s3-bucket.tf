# Creates first bucket
resource "aws_s3_bucket" "capcom-bkt" {
  bucket        = "capcom-bkt"
  force_destroy = "true"

  tags = {
    Name = "capcom"
  }
}

# Houses all the images within capcom-bkt
resource "aws_s3_object" "capcom-imgs" {
  for_each = fileset("/Users/tobi/S3-Project/Pictures", "*") #  Fileset function returns all files within this specific pathname

  bucket = aws_s3_bucket.capcom-bkt.id
  key    = each.key
  source = "/Users/tobi/S3-Project/Pictures/${each.value}" # Pathname of each of those files 
}

# Enables public access for the bucket
resource "aws_s3_bucket_public_access_block" "bkt-public-access" {
  bucket                  = aws_s3_bucket.capcom-bkt.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

}

# Grabs policy to 
data "aws_iam_policy_document" "obj-policy" {
  statement {
    actions = [
      "s3:GetObject"
    ]
    effect = "Allow"
    resources = [
      "${aws_s3_bucket.capcom-bkt.arn}/*"
    ]
    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}


resource "aws_s3_bucket_ownership_controls" "bkt-ownership" {
  bucket = aws_s3_bucket.capcom-bkt.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }

}

resource "aws_s3_bucket_policy" "capcom-bkt-policy" {
  bucket = aws_s3_bucket.capcom-bkt.id
  policy = data.aws_iam_policy_document.obj-policy.json

}





