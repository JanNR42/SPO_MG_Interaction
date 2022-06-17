# Berechtigung einer System assigned Managed Identity auf eine Sharepoint Seite

## Vorrausetzungen:

- Logic App mit einer System assigned Managed Identity
- Ziel Sharepoint Seite
- Berechtigungen zum Setzen von Graph application scope und SharePoint site permissions
- Powershell SDK für Graph -> [Powershell-SDK](https://docs.microsoft.com/en-us/powershell/microsoftgraph/installation?toc=%2Fgraph%2Ftoc.json&view=graph-powershell-1.0)

## Setzen der notwendigen Berechtigungen

1. Notiere die ObjectID deiner Managed Identity:
   - Unter der Logic App im Identity Tab
   - Im Azure AD unter Enterprise Applications/ManagedIdentities -> "LogicAppName"
2. Notiere die Application Id deiner Managed Identity:
   - Im Azure AD unter Enterprise Applications/ManagedIdentities -> "LogicAppName"
![Image of Managed Identity IDs](/pics/mg_ids.jpg)
3. Trage im Skript "Grant_Scope_MG.ps1" die ObjectId ein
4. Führe es aus
5. Trage im Skript "Grant_App_Access_MG.ps1" folgendes ein:
   - Application ID deiner Managed Identity
   - displayName deiner Managed Identity/LogicApp
   - Sharepoint Tenant Link : "tenant.sharepoint.com"
   - Ziel-Sharepoint Seiten Name: "Test_MySpo_Site"
6. Führe es aus.

## HTTP-Request über Managed Identity in der Logic App

Im Logic App Designer kann nun über eine HTTP Action ein Request der Sharepoint Seite durchgeführt werden.

1. In der HTTP Action eine Method auswählen bspw. GET
2. Für die URI folgenden eintragen
   - <b> URI: https://graph.microsoft.com/v1.0/sites/tenant.sharepoint.com:/sites/SharePointSeite:/
3. Auf Add new parameter -> Authentication -> Managed Identity auswählen
   1. ![IMAGE OF HTTP ACTION](/pics/http_action1.png)
   2. ![IMAGE OF HTTP ACTION 2](/pics/http_action2.png) Audience= "https://graph.microsoft.com" 

## SUCCESS











