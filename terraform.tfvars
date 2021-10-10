RG = "hei-gis-infraint-P"
location = "eastus"
cidrs = [
    {name = "hei-gis-infraint-P-hub-vnet", cidr = "10.0.0.0/16"},
    {name = "AzureFirewallSubnet", cidr = "10.0.0.0/24"},
    {name = "hei-gis-infraint-P-Spoke1-vnet", cidr = "20.0.0.0/16"}, 
    {name = "hei-gis-infraint-P-Spoke1-subnet", cidr = "20.0.0.0/24"},
    {name = "hei-gis-infraint-P-Spoke2-vnet", cidr = "30.0.0.0/16"}, 
    {name = "hei-gis-infraint-P-Spoke2-subnet", cidr = "30.0.0.0/24"},
    {name = "AzureBastionSubnet", cidr = "10.0.1.0/26"}
]
nic_name= ["hei-gis-infraint-P-spoke1-nic","hei-gis-infraint-P-spoke2-nic"]

FirewallRG = "hei-gis-infraint-P-RG"
publicip = "hei-gis-infraint-P-firewall-pubip"
Firewall = "hei-gis-infraint-P-Firewall"

routetable = ["rt-hei-gis-infraint-P-01", "rt-hei-gis-infraint-P-02"]

route = [{name="to_20.0.0.0", addressprefix= "30.0.0.0/24",next_hop_type = "VirtualAppliance"},
         {name="to_30.0.0.0", addressprefix="20.0.0.0/24",next_hop_type ="VirtualAppliance"},
         {name="Default", addressprefix="0.0.0.0/0",next_hop_type ="VirtualAppliance"}]

Bastion = "rt-hei-gis-infraint-P-Bastion"   
Bastion-pubip = "rt-hei-gis-infraint-P-Bastion-Pubip"

storage_image_reference = [{publisher ="RedHat",offer = "RHEL",sku = "7-LVM", version ="latest"}]

storage_os_disk = [{name = "myosdisk1",caching ="ReadWrite",create_option="FromImage",managed_disk_type="Standard_LRS"},
                   {name = "myosdisk2",caching ="ReadWrite",create_option="FromImage",managed_disk_type="Standard_LRS"}]      
  
  
os_profile = [{computer_name="HNK-VM1",admin_username="azuser",admin_password="Covid@20"},
              {computer_name="HNK-VM2",admin_username="azuser",admin_password="Covid@20"}]

vm_name = ["hei-gis-infraint-p-linux-vm1","hei-gis-infraint-p-linux-vm2"]



