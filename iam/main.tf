provider "aws" {
  region = "ap-northeast-1"
  
}

resource "aws_iam_user" "myUser" {
  name = "CS"
}

resource "aws_iam_policy" "customPolicy" {
  name = "GlacierEFSEC2Policy"

  policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Sid": "VisualEditor0",
			"Effect": "Allow",
			"Action": [
				"ec2:AuthorizeSecurityGroupIngress",
				"ec2:ReplaceRouteTableAssociation",
				"ec2:ModifyManagedPrefixList",
				"ec2:CreateIpamPool",
				"ec2:ResetInstanceAttribute",
				"ec2:ResetEbsDefaultKmsKeyId",
				"ec2:ModifyInstanceMetadataDefaults",
				"ec2:ModifyVpnConnectionOptions",
				"ec2:ReleaseIpamPoolAllocation",
				"ec2:DisassociateIpamResourceDiscovery",
				"ec2:CreateIpamExternalResourceVerificationToken",
				"ec2:CopyFpgaImage",
				"ec2:CreateTransitGateway",
				"ec2:ModifyDefaultCreditSpecification",
				"ec2:ModifyIpam",
				"ec2:DeleteIpamResourceDiscovery",
				"ec2:DeleteFleets",
				"ec2:DeleteVpcEndpointServiceConfigurations",
				"ec2:ModifyAvailabilityZoneGroup",
				"ec2:CreateCapacityReservationFleet",
				"elasticfilesystem:DescribeFileSystemPolicy",
				"ec2:CreateStoreImageTask",
				"elasticfilesystem:DescribeFileSystems",
				"ec2:ModifyTransitGatewayVpcAttachment",
				"ec2:TerminateInstances",
				"ec2:DeletePlacementGroup",
				"ec2:ResetAddressAttribute",
				"ec2:DisassociateTransitGatewayMulticastDomain",
				"ec2:DisassociateClientVpnTargetNetwork",
				"ec2:DeleteRoute",
				"ec2:ModifyCapacityReservationFleet",
				"ec2:CreateTrafficMirrorSession",
				"ec2:EnableImageBlockPublicAccess",
				"ec2:AllocateAddress",
				"ec2:CreateManagedPrefixList",
				"ec2:EnableFastLaunch",
				"ec2:CreateVpcEndpoint",
				"ec2:CreateInstanceEventWindow",
				"ec2:DisableEbsEncryptionByDefault",
				"glacier:ListProvisionedCapacity",
				"ec2:ResetFpgaImageAttribute"
			],
			"Resource": "*"
		}
	]
}
EOF
}

resource "aws_iam_policy_attachment" "policyBind" {
  name = "attachment"
  users = [aws_iam_user.myUser.name]
  policy_arn = aws_iam_policy.customPolicy.arn
}