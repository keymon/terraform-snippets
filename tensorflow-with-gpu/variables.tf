variable "env" {
  description = "Environment name"
  default = "tensorflow"
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

variable "public_cidrs" {
  description = "CIDR for public subnet indexed by AZ"
  default     = {
    zone0 = "10.0.0.0/24"
  }
}

variable "client_ips" {
  description = "Comma listed IPs to grant access from. You can run: export TF_VAR_client_ips=$(curl -qfs ifconfig.co)/32"
}

variable "amis" {
  description = "Base AMI to launch the instances with"
  default = {
    # us-east-1 = "ami-cf5028a5" # From https://gist.github.com/erikbern/78ba519b97b440e10640
    us-east-1 = "ami-2cbf3e44"
  }
}

variable "instance_type" {
  description = "Instance type to use"
  #default     = "t2.micro"
  default     = "g2.2xlarge"
  #default     = "g2.8xlarge"
}
