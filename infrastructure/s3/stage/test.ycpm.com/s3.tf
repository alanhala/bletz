resource "aws_iam_group" "test_ycpm_com_developers" {
  name = "${var.bucket_name}-deploy"
}

resource "aws_iam_policy" "test_ycpm_com_policy" {
  name        = "${var.bucket_name}-deploy"
  description = "Deploy policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket_name}",
                "arn:aws:s3:::${var.bucket_name}/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation",
                "s3:ListAllMyBuckets"
            ],
            "Resource": "arn:aws:s3:::*"
        }
    ]
}
EOF
}

resource "aws_iam_group_policy_attachment" "test_ycpm_com_developers_test_ycpm_com_policy_attachment" {
  group      = "${aws_iam_group.test_ycpm_com_developers.name}"
  policy_arn = "${aws_iam_policy.test_ycpm_com_policy.arn}"
}
resource "aws_iam_group" "test_ycpm_com_developers" {
  name = "${var.bucket_name}-deploy"
}

resource "aws_iam_policy" "test_ycpm_com_policy" {
  name        = "${var.bucket_name}-deploy"
  description = "Deploy policy"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::${var.bucket_name}",
                "arn:aws:s3:::${var.bucket_name}/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:GetBucketLocation",
                "s3:ListAllMyBuckets"
            ],
            "Resource": "arn:aws:s3:::*"
        }
    ]
}
EOF
}

resource "aws_iam_group_policy_attachment" "test_ycpm_com_developers_test_ycpm_com_policy_attachment" {
  group      = "${aws_iam_group.test_ycpm_com_developers.name}"
  policy_arn = "${aws_iam_policy.test_ycpm_com_policy.arn}"
}
