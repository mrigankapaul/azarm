### Define Deployment Variables
{
    $location = 'canadacentral'
    $resourceGroupName = 'mriganka-simple-iaas-template'
    $resourceDeploymentName = 'mriganka-iaas-template-deployment'
    $templatePath = (Get-Item .).FullName
    $templateFile = 'simpleIaas.json'
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