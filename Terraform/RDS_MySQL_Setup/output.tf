output "instance_arn" {
  value       = join("", aws_db_instance.mydb.*.arn)
  description = "ARN of the instance"
}

output "instance_address" {
  value       = join("", aws_db_instance.mydb.*.address)
  description = "Address of the instance"
}

output "instance_endpoint" {
  value       = join("", aws_db_instance.mydb.*.endpoint)
  description = "DNS Endpoint of the instance"
}