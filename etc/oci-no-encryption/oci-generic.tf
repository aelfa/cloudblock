terraform {
  required_providers {
    oci = {
      source = "oracle/oci"
    }
  }
}

variable "oci_config_profile" {
  type        = string
  description = "The oci configuration file, generated by 'oci setup config'"
}

variable "oci_root_compartment" {
  type        = string
  description = "The tenancy OCID a.k.a. root compartment, see README for CLI command to retrieve it."
}

variable "oci_region" {
  type        = string
  description = "Region to deploy services in."
}

locals {
  oci_region = lower(var.oci_region)
}

variable "oci_imageid" {
  type        = string
  description = "An OCID of an image, the playbook is compatible with Ubuntu 18.04+ minimal"
}

variable "oci_adnumber" {
  type        = number
  description = "The OCI Availability Domain, only certain AD numbers are free-tier, like Ashburn's 2"
}

variable "oci_instance_shape" {
  type        = string
  description = "The size of the compute instance, only certain sizes are free-tier"
}

variable "oci_instance_diskgb" {
  type        = string
  description = "Size of system boot disk, in gb"
  default     = 50
}

variable "oci_instance_memgb" {
  type        = string
  description = "Memory GB(s) for instance"
  default     = 1
}

variable "oci_instance_ocpus" {
  type        = string
  description = "Oracle CPUs for instance"
  default     = 1
}

variable "ssh_key" {
  type        = string
  description = "Public SSH key for SSH to compute instance, user is ubuntu"
}

variable "vcn_cidr" {
  type        = string
  description = "Subnet (in CIDR notation) for the OCI network, change if would overlap existing resources"
}

variable "mgmt_cidr" {
  type        = string
  description = "Subnet (in CIDR notation) granted access to Pihole WebUI and SSH running on the compute instance. Also granted DNS access if dns_novpn = 1"
}

variable "client_cidrs" {
  type        = list(any)
  description = "An (optional) list of additional CIDR networks able to use the DNS service with VPN"
}

variable "ph_prefix" {
  type        = string
  description = "A friendly prefix (like 'pihole') affixed to many resources, like the bucket name."
}

variable "ph_password" {
  type        = string
  description = "Password for Pihole WebUI access"
}

variable "dns_novpn" {
  type        = number
  description = "Flag to enable (1) or disable (0) mgmt_cidr's access to direct DNS lookups"
}

variable "project_url" {
  type        = string
  description = "URL of the git project"
}

variable "docker_network" {
  type        = string
  description = "docker network ip"
}

variable "docker_gw" {
  type        = string
  description = "docker network gateway ip"
}

variable "docker_doh" {
  type        = string
  description = "cloudflared_doh container ip"
}

variable "docker_pihole" {
  type        = string
  description = "pihole container ip"
}

variable "docker_wireguard" {
  type        = string
  description = "wireguard container ip"
}

variable "docker_webproxy" {
  type        = string
  description = "https web proxy container ip"
}

variable "wireguard_network" {
  type        = string
  description = "wireguard vpn network ip"
}

variable "wireguard_peers" {
  type        = number
  description = "number of peers to generate for wireguard"
}

variable "doh_provider" {
  type        = string
  description = "DNS over HTTPS provider, one of adguard applied-privacy cloudflare google hurricane-electric libre-dns opendns opendns pi-dns quad9-recommended"
}

variable "vpn_traffic" {
  type        = string
  description = "dns peers or all, sets instance1's Wireguard VPN client configuration to route only dns traffic or all traffic through the VPN."
}

variable "vpn_traffic2" {
  type        = string
  description = "dns peers or all, sets instance2's Wireguard VPN client configuration to route only dns traffic or all traffic through the VPN."
}
