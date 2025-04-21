resource "null_resource" "aws_example" {
  provisioner "local-exec" {
    command = "echo Deploying AWS Infrastructure"
  }
}
