{

    #// $env: Needs to change
    $policyName = 'policyLocationDefinition'
    $policyAssignment = 'policyLocationAssignment'
    $policyFile = $env:SystemDrive + '\' + 'policylocation.json' 
    
    New-AzPolicyDefinition `
        -Name $policyName `
        -Policy $policyFile `
        -Verbose
    
    $resourceGroup = Get-AzResourceGroup -Name 'mriganka-paas'
    $policy = Get-AzPolicyDefinition -Name $policyName
    
    New-AzPolicyAssignment `
        -Name $policyAssignment `
        -PolicyDefinition $policy `
        -Scope $resourceGroup.ResourceId `
        -Verbose
    
    }