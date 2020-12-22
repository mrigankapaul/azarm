### Define variables
{

    $location = 'canadacentral'
    $resourceGroupName = 'mriganka-arm-nested'
    $resourceDeploymentSolutionName = 'mriganka-arm-nested-deployment'
    $templateBasePath = $env:SystemDrive + '\' + 'pluralsight' + '\' + 'nested'
    $templateFile = 'azureDeploy.json'
    $template = $templateBasePath + '\' + $templateFile
    $templateParametersFile = 'azureDeploy.parameters.json'
    $templateParameters = $templateBasePath + '\' + $templateParametersFile
    
    }
    
    ### Create Resource Group
    {
    
    New-AzResourceGroup `
        -Name $resourceGroupName `
        -Location $Location `
        -Verbose -Force
    
    }
    
    ### Deploy IaaS Solution
    {
    
    New-AzResourceGroupDeployment `
        -Name $resourceDeploymentSolutionName `
        -ResourceGroupName $resourceGroupName `
        -TemplateFile $template `
        -TemplateParameterFile $templateParameters `
        -Verbose -Force
    
    }