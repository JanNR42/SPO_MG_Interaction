
$application = @{
    id = "" #<--- hier die Application ID deiner Managed Identity eintragen
    displayName = "" #<--- DisplayName deiner MangedIdentity bzw. Logic App
}

# Rolle die der MG zugewiesen werden soll read/write
$appRole = "write"

# Hier die Sharepoint Seite, auf die berechtigt werden soll eintragen
$spoTenant = "" # bsp. tenant.sharepoint.com - tenant durch den Ziel-Tenant Namen ersetzen 
$spoSite  = "" #Sharepoint-Seiten Name hier eintragen

# Ergibt den spezifischen SP Link
$spoSiteId = $spoTenant + ":/sites/" + $spoSite + ":"

Import-Module Microsoft.Graph.Sites
#Verbindung zur Graph API -> muss von einem Sharepoint Admin oder User mit Schreibberechtigungen auf die jeweilige SP Seite sein
Connect-MgGraph -Scope Sites.FullControl.All
#Setzen der Berechtigungen der MG auf die SP Seite
New-MgSitePermission -SiteId $spoSiteId -Roles $appRole -GrantedToIdentities @{ Application = $application }