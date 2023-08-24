<# 
    .DESCRIPTION
     This Script will compare 2 input csv's for validation of data(files) stored in local file system and sharepoint library. 
    .SYNOPSIS
    validate data(files) stored in local file system and sharepoint library.
    .COMPONENT
    SharePoint Online,Microsft 365,Migration,Data Validation
#>
#Inputs 
$input_File1 = Import-Csv -Path "$pwd\Input\a.csv"
$input_File2 = Import-Csv -Path "$pwd\Input\b.csv"
#Outputs
$outputFile = "$pwd\Output\compare.csv"
$localFileSystemReplace = 'C:\Users\user1\Documents\' 
$sharepointServerRelativePathReplace = '/sites/sitename/libraryname/';
$compare = [System.Collections.ArrayList]@()
$time1 = Measure-Command {
    $compare = $input_File1 | ForEach-Object -Parallel {
    
        $filesystempath = $_.Path.replace($using:localFileSystemReplace , '')
        $serverrelativepath = $using:input_File2 | Where-Object { $_.Path.replace($using:sharepointServerRelativePathReplace, '') -eq $filesystempath }

        $matchedCount = ($serverrelativepath | Measure-Object).Count
        write-host $_."size(bytes)" $matchedCount
        if ($matchedCount -eq 0) {
            return ($_ | Select-Object @{Name = "Result"; Expression = { "Failed" } }, *, @{Name = "File_Or_FolderName"; Expression = { $filesystempath } }, @{Name = "ServerRelativePath"; Expression = { $serverrelativepath | ConvertTo-Json } }, @{Name = "Count Matched"; Expression = { $matchedCount } })
        }

 
    
    }  
}

write-host "Total Count Which we got" $compare.Count 
write-host "Time took" ($time1 | ConvertTo-Json )

$compare | Export-Csv -Path $outputFile -Encoding UTF8 -NoTypeInformation
