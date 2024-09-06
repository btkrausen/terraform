output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}

output "vpc_id" {
  value = aws_vpc.main.id
}

