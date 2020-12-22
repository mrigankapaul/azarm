### Get Azure Subscription ID
{

    $subscriptionID = (Get-AzSubscription).Id[0]
    
    }
    
    ### Create New RBAC Role
    {
    
    $role = Get-AzRoleDefinition "Virtual Machine Contributor"
    
    $role.Id = $null
    $role.Name = "Virtual Machine Operator"
    $role.Description = "Can monitor and restart virtual machines."
    $role.IsCustom = 'True'
    $role.Actions.Clear()
    $role.Actions.Add("Microsoft.Storage/*/read")
    $role.Actions.Add("Microsoft.Network/*/read")
    $role.Actions.Add("Microsoft.Compute/*/read")
    $role.Actions.Add("Microsoft.Compute/virtualMachines/start/action")
    $role.Actions.Add("Microsoft.Compute/virtualMachines/restart/action")
    $role.Actions.Add("Microsoft.Authorization/*/read")
    $role.Actions.Add("Microsoft.Resources/subscriptions/resourceGroups/read")
    $role.Actions.Add("Microsoft.Insights/alertRules/*")
    $role.Actions.Add("Microsoft.Support/*")
    $role.AssignableScopes.Clear()
    $role.AssignableScopes.Add("/subscriptions/$subscriptionID")
    

    
    }
    
    ### Assign Role to Group
    {

        New-AzRoleDefinition -Role $role
    
    $adGroups = Get-AzADGroup -SearchString 'Virtual Machine Operator'
    
    New-AzRoleAssignment `
        -ObjectId $adGroups[0].Id.Guid `
        -RoleDefinitionName 'Virtual Machine Operator' `
        -Scope "/subscriptions/$subscriptionID"
    
    }