variable "RG" {
  type = string
}


variable "location" {
    type = string
  
}
variable "cidrs" {
    description = "cidr block for vnet and subnets"
    type = list(object(
        {
        name = string
        cidr = string
        }
        ))
}
variable "nic_name"{
  description = "routing the network traffic"
  type = list
}
variable "FirewallRG" {
    type = string
  
}
variable "publicip" {
    type = string
  
}
variable "Firewall" {
    type = string
  
}
variable "routetable"{
  description = "routing the network traffic"
  type = list
}


variable "route"{
  description = "routing the network traffic"
  type = list(object(
  {
  name = string  
  addressprefix = string
  next_hop_type = string
  }
  ))
}
variable "Bastion" {
  type        = string
}

variable "Bastion-pubip" {
  type        = string
}
variable "storage_image_reference"{
  description = "storage_image_reference"
  type = list(object(
  {
   publisher = string
    offer     = string
    sku       = string
    version   = string
  }
  ))
}
variable "storage_os_disk"{
  description = "storage_os_disk"
  type = list(object(
  {
    name              = string
    caching           = string
    create_option     = string
    managed_disk_type = string
  }
  ))
}

variable "os_profile"{
  description = "os_profile"
  type = list(object(
  {
    computer_name     = string
    admin_username    = string
    admin_password     = string
    
  }
  ))
}
variable "vm_name" {
  type = list
  
}

