$webrootWMIobjects = (get-wmiobject Win32_Product | Where-Object {$_.Name -like "*Webroot*"})

if($webrootWMIobjects.count -eq 0)
{
    Write-Host "Webroot is not found on the computer, possible that its not installed"
}
elseif($webrootWMIobjects.count -gt 1)
{
   Write-Host "Multiple webroots appaers to be installad  on this computer"


   foreach($webrootInstalled in $webrootWMIobjects)
   {
        $webrootInstalled.Uninstall()
   }
}
else
{
    Write-Host "One webroot installation found"

    $webrootWMIobjects.Uninstall()
}
