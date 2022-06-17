# Hier die ObjectID der Managed Identity eintragen
$ObjectId = ""

# Graph Scope für die Managed Identity
$graphScope = "Sites.Selected" 

#Verbindung mit Graph-API herstellen ggfs. deine Account-Berechtigungen beachten 
Connect-MgGraph -Scope AppRoleAssignment.ReadWrite.All
$graph = Get-MgServicePrincipal -Filter "AppId eq '00000003-0000-0000-c000-000000000000'" #<--- AppId ist die von GRAPH - nicht ändern
$graphAppRole = $graph.AppRoles | Where-Object Value -eq $graphScope

#Daten für das Assignment der App Rolles
$appRoleAssignment = @{
    "principalId" = $ObjectId
    "resourceId"  = $graph.Id
    "appRoleId"   = $graphAppRole.Id
}

#Setzen der Graph permissions
New-MgServicePrincipalAppRoleAssignment -ServicePrincipalId $ObjectID -BodyParameter $appRoleAssignment | Format-List