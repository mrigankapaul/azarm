{
    $location = 'canadacentral'
    $resourceGroupName = 'mriganka-simple-paas-template'
    $resourceDeploymentName = 'mriganka-paas-template-deployment'
    $templatePath = (Get-Item .).FullName
    $templateFile = 'simplePaas.json'
    $template = $templatePath + '/' + $templateFile
    
    }
    
    ### Create Resource Group
    {
    New-AzResourceGroup `
        -Name $resourceGroupName `
        -Location $location `
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