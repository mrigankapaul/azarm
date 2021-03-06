{
    $resourceGrouplocation = 'canadacentral'
    $resourceGroupName = 'mriganka-paas'
    $resourceDeploymentName = 'mriganka-paas-deployment'
    $templatePath = (Get-Item .).FullName
    $templateFile = 'fullPaas.json'
    $template = $templatePath + '/' + $templateFile
    
    }
    
    ### Create Resource Group
    {
    New-AzResourceGroup `
        -Name $resourceGroupName `
        -Location $resourceGrouplocation `
        -Verbose -Force
    }
    
    ### Deploy Resources
    {
    New-AzResourceGroupDeployment `
        -Name $resourceDeploymentName `
        -ResourceGroupName $resourceGroupName `
        -TemplateFile $template `
        -Verbose -Force
    }