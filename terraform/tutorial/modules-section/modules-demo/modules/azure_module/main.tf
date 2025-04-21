resource "null_resource" "azure_example" {
  provisioner "local-exec" {
    command = "echo Deploying Azure Infrastructure"
  }
}
