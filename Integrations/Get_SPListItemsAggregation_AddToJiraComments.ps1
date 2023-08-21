<#
.Synopsis
   Add Comments To Jira Story From SharePoint List Items Count and View Items Count using PowerShell   
.DESCRIPTION
   This script will get the list items count and view items count from SharePoint list and add the comments to Jira user story
#>

#Importing the required modules
Import-Module -Name PnP.PowerShell
Import-Module -Name JiraPS
#Setting the variables
$SiteURL = "https://sharepoint.com/sites/sitename"
$UserName = "username"
$Password = "password"
$ListName1 = "listname"
$ListName2= "listname2"
$viewName="View1"






#Connect to SharePoint Online
Connect-PnPOnline -Url $SiteURL -Credentials (New-Object System.Management.Automation.PSCredential($UserName, (ConvertTo-SecureString $Password -AsPlainText -Force)))


$getListItemTotalCount1=Get-PnPList -Identity $ListName1
$getListItemTotalCount2=Get-PnPList -Identity $ListName2
#get list items count based on view
$ListItemViewCount1 = (Get-PnPListItem -List $ListName1 -View $viewName | Measure-Object).Count
$ListItemViewCount2 = (Get-PnPListItem -List $ListName2 -View $viewName | Measure-Object).Count

#create here string in powershell
$JiraComment = @"
Total List1 Items Count: $getListItemTotalCount1
Total List2 Items Count: $getListItemTotalCount2
Total List1 Items View Count: $ListItemViewCount1
Total List2 Items View Count: $ListItemViewCount2
"@


#set the jira server configuration
$JiraServerConfiguration = Set-JiraServerConfiguration -JiraUrl $JiraURL
#


#Setting the variables
$JiraURL = "https://jira.com"
$JiraUserName = "username"
$JiraPassword = "password"
$JiraProjectKey = "projectkey"
$JiraIssueKey = "issuekey"
$JiraCred=(New-Object System.Management.Automation.PSCredential($JiraUserName, (ConvertTo-SecureString $JiraPassword -AsPlainText -Force)))

# add comments to user story
Add-JiraComment -JiraUrl $JiraURL -Credentials $JiraCred -JiraProjectKey $JiraProjectKey -JiraIssueKey $JiraIssueKey -JiraComment $JiraComment

