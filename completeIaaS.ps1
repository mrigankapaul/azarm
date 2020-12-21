### Define Deployment Variables
{
    $location = 'canadacentral'
    $resourceGroupName = 'mriganka-iaas'
    $resourceDeploymentName = 'mriganka-iaas-deployment'
    $templatePath = (Get-Item .).FullName
    $templateFile = 'completeIaas.json'
    $template = $templatePath + '\' + $templateFile
    $password = "Mircosoft@123"
    $securePassword = $password | ConvertTo-SecureString -AsPlainText -Force
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
    $additionalParameters = New-Object -TypeName Hashtable
    $additionalParameters['vmAdminPassword'] = $securePassword
    New-AzResourceGroupDeployment `
        -Name $resourceDeploymentName `
        -ResourceGroupName $resourceGroupName `
        -TemplateFile $template `
        @additionalParameters `
        -Verbose -Force
    }