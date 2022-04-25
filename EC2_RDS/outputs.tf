output "ec2-public-dns" {
    value = aws_instance.ash-ec2.public_dns
}

output "ec2-public-ip" {
    value = aws_instance.ash-ec2.public_ip
}

output "ec2-public-private-dns" {
    value = aws_instance.ash-ec2.private_dns
}

output "ec2-public-private-ip" {
    value = aws_instance.ash-ec2.private_ip
}

output "db-address" {
    value = aws_db_instance.ash-db.address
}

output "db-arn" {
    value = aws_db_instance.ash-db.arn
}

output "db-domain" {
    value = aws_db_instance.ash-db.domain
}

output "db-endpoint" {
    value = aws_db_instance.ash-db.endpoint
}

output "db-hosted_zone_id" {
    value = aws_db_instance.ash-db.hosted_zone_id
}

output "db-id" {
    value = aws_db_instance.ash-db.id
}

output "db-name" {
    value = aws_db_instance.ash-db.name
}

output "db-port" {
    value = aws_db_instance.ash-db.port
}