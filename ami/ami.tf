resource "aws_ami_from_instance" "practice" {
  name = "practice"
  source_instance_id = "i-0c12cf8552ad42a64"
}

output "ami" {
  value = aws_ami_from_instance.practice.id
}
