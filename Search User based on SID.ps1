$SID = "" #insert SID that you're looking for
Get-ADUser -Filter * | Select-Object Name, SID | Where-Object SID -eq $SID