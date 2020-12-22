### Get vmWeb VMs
{

    $VMs = Get-AzResource | `
        Where-Object {$_.Name -like "vmWeb-*" -and $_.ResourceType -eq 'Microsoft.Compute/virtualMachines'}
    
    }
    
    ### Add Tags to Resources
    {
    
    $tags = New-Object -TypeName Hashtable
    $tags += @{"department"="IT"}
    $tags += @{"environment"="Production"}
    
    foreach($VM in $VMs){
        Set-AzResource `
            -Tag $tags `
            -ResourceId $VM.ResourceId
    }
    
    }