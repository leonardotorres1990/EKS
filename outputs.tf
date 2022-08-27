output "eks_subnet_ids" {
  value = ["${data.aws_subnet.eks_subnet.*.id}"]
}

