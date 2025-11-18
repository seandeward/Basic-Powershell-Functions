# Find all users in "Users" OU and export to .csv
$OUpath = '' # insert which OU you want to search here
$ExportPath = '' # insert where you want the file to be saved here
Get-ADUser -Filter 'enabled -eq "true"' -SearchBase $OUpath | Select-object DistinguishedName,Name,UserPrincipalName | Export-Csv -NoType $ExportPath