<#
# .DESCRIPTION
#    Get Jira User Stories using powershell.
# #>

#import jiraps module
Import-Module -Name JiraPS

#Setting the variables
$JiraURL = "https://jira.com"
$JiraUserName = "username"
$JiraPassword = "password"
$JiraCred=(New-Object System.Management.Automation.PSCredential($JiraUserName, (ConvertTo-SecureString $JiraPassword -AsPlainText -Force)))

#set the jira server configuration
$JiraServerConfiguration = Set-JiraServerConfiguration -JiraUrl $JiraURL


#create a new jira session
$JiraSession = New-JiraSession -JiraServerConfiguration $JiraServerConfiguration -Credentials $JiraCred


#get all the user stories from jira under a project
$JiraIssues = Get-JiraIssue -JiraSession $JiraSession -JiraProjectKey $JiraProjectKey -JiraIssueType "Story" -MaxResults 1000
