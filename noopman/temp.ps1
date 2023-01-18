$fqdn       = 'barahår.se'
$webappname = 'barahar'
$webapp = Get-AzWebApp -Name $webappname
$webapp.HostNames.Add($fqdn)
Set-AzWebApp $webapp

New-AzWebAppCertificate -ResourceGroupName $webapp.ResourceGroup -WebAppName $webapp.Name -Name $webapp.HostNames[1] -HostName $webapp.HostNames[1]

New-AzWebAppCertificate -ResourceGroupName $webapp.ResourceGroup -WebAppName $webapp.Name -Name 'barahår' -HostName $fqdn -CertificateFilePath 'C:\temp\barahår.pfx' -CertificatePassword 'password'

# az webapp config ssl create --hostname $webapp.HostNames[1] --name $webapp.Name --resource-group $webapp.Resourcegroup
# [--slot]