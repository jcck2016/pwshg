#Load PowerCLI Modules
Import-module VMware.PowerCLI

###################### Variables -  #####################
$vCenter = "<vCenter FQDN or IP>"
$vDSName = "vDS Switch Name"
$VDPG ="<PortGroup Name>"
$Cluster1-Host1FQDN = "<C1ESX1 FQDN or IP>"
$Cluster2-Host1FQDN = "<C1ESX2 FQDN or IP>"
$Cluster3-Host1FQDN = "<C1ESX3 FQDN or IP>"
$Cluster4-Host1FQDN = "<C1ESX4 FQDN or IP>"
$Cluster5-Host1FQDN = "<C1ESX5 FQDN or IP>"
$VSPG ="<PortGroup Name>"
$VLAN = "<VLAN ID>" #enter 0 if no VLAN Tag required
$Ports = "8" #Port allocation is Elastic by default which will increase the port count when the limit is reached by increments of 8
$LoadBalancing = "LoadBalanceLoadBased" #Based on Physical Nic Load, change as required (LoadBalanceLoadBased, LoadBalanceIP, LoadBalanceSrcMac, LoadBalanceSrcId, ExplicitFailover)

################################################################

#Connect to vCenter
Connect-VIServer $vCenter -Credential (Get-Credential) -force

#Create Distributed Virtual Port Group.
Get-VDSwitch -Name $vDSName | New-VDPortGroup -Name $VDPG -VLanId $VLAN -NumPorts 8

Get-VMHost $Cluster1-Host1FQDN  | Get-VirtualSwitch -name vSwitch3 | New-VirtualPortGroup -Name Application33 -VLanID 331
Get-VMHost $Cluster2-Host1FQDN  | Get-VirtualSwitch -name vSwitch3 | New-VirtualPortGroup -Name Application33 -VLanID 331
Get-VMHost $Cluster3-Host1FQDN  | Get-VirtualSwitch -name vSwitch3 | New-VirtualPortGroup -Name Application33 -VLanID 331
Get-VMHost $Cluster4-Host1FQDN  | Get-VirtualSwitch -name vSwitch3 | New-VirtualPortGroup -Name Application33 -VLanID 331
Get-VMHost $Cluster5-Host1FQDN  | Get-VirtualSwitch -name vSwitch3 | New-VirtualPortGroup -Name Application33 -VLanID 331