resource "aws_sns_topic" "topic" {
  name = "ctl-static-bucket-notification"
  policy = file("snspolicy.json")
}

resource "aws_sns_topic_subscription" "user_email" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = "codvatechlabs@gmail.com"
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bucket.id
  topic {
    topic_arn     = aws_sns_topic.topic.arn
    events        = ["s3:ObjectCreated:*"]
  }
}
