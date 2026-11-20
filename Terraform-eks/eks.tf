module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 21.0"

    name = "${local.name}-eks-cluster"
    kubernetes_version = "1.31"

    endpoint_private_access = true
    endpoint_public_access  = true

    vpc_id     = module.vpc.vpc_id
    subnet_ids = module.vpc.private_subnets

    control_plane_subnet_ids = module.vpc.intra_subnets
    addons = {
        core_dns = {
            addon_name = "coredns"
            resolve_conflicts = "OVERWRITE"
        }
        reverse_proxy = {
            addon_name = "vpc-cni"
            resolve_conflicts = "OVERWRITE"
        }
        kube_proxy = {
            addon_name = "kube-proxy"
            resolve_conflicts = "OVERWRITE"

        }
    }

    eks_managed_node_groups = {
        eks_nodes = {
        instance_types = ["t3.medium"]

        desired_size = 2
        max_size     = 3
        min_size     = 1

        capacity_type = "SPOT"
        }
    }

    tags = {
        Terraform   = "true"
        Environment = local.environment
    }
}