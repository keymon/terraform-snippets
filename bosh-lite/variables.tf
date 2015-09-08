variable "env" {
  description = "Environment name"
  default = "myenv"
}

variable "ssh_user" {
  description = "Username used to ssh into VMs."
  default     = "ubuntu"
}

variable "region"     {
  description = "AWS region"
  default     = "us-east-1"
}

variable "zones" {
  description = "AWS availability zone"
  default     = {
    zone0 = "us-east-1a"
  }
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "10.0.0.0/16"
}

variable "office_cidrs" {
  description = "CSV of CIDR addresses for our office which will be trusted"
  default     = "80.194.77.90/32,80.194.77.100/32"
}

variable "public_cidrs" {
  description = "CIDR for public subnet indexed by AZ"
  default     = {
    zone0 = "10.0.0.0/24"
  }
}

variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    eu-west-1 = "ami-234ecc54"
    eu-central-1 = "ami-9a380b87"
  }
}

variable "key_pair_name" {
  description = "SSH Key Pair name to be used to launch EC2 instances"
  default     = "keymon"
}
