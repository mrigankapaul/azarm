### Define Deployment Variables
{
    $location = 'canadacentral'
    $resourceGroupName = 'mriganka-iaas'
    $resourceDeploymentName = 'mriganka-iaas-deployment'
    $templatePath = (Get-Item .).FullName
    $templateFile = 'completeIaas.json'
    $template = $templatePath + '\' + $templateFile
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