resource "aws_eks_node_group" "danit" {
  cluster_name    = aws_eks_cluster.danit.name
  node_group_name = var.name
  node_role_arn   = aws_iam_role.danit-node.arn
  #subnet_ids      = module.vpc.public_subnets
  subnet_ids = var.subnets_ids

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  instance_types = ["t3.large"]

  labels = {
    "node-type" : "tests"
  }

  depends_on = [
    aws_iam_role_policy_attachment.kubeedge-node-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.kubeedge-node-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.kubeedge-node-AmazonEC2ContainerRegistryReadOnly,
  ]
  tags = merge(
    var.tags,
    { Name = "${var.name}-node-group" }
  )
}


#resource "aws_autoscaling_group_tag" "kubeedge" {
#  for_each = toset(
#    [for asg in flatten(
#      [for resources in aws_eks_node_group.kubeedge.resources : resources.autoscaling_groups]
#    ) : asg.name]
#  )
#
#  autoscaling_group_name = each.value
#
#  tag {
#    key                 = "Name"
#    value               = "${var.name}-node"
#    propagate_at_launch = true
#  }
#}
