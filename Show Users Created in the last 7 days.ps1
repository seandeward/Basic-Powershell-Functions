# Show Users Created in the last 7 days

$filePath = "" # enter your own file path here

# get all users
$allUsers = Get-ADUser -filter * -Properties whenCreated
$exportPath = "$filePath$(Get-Date -Format 'yyyy-MM-dd').csv"


# Get users that have been made within the past 7 days and export them to a .csv on the desktop
$allUsers | Select-Object Name, SamAccountName, Enabled, whenCreated | Where-Object { $_.whenCreated -gt (Get-Date).AddDays(-7) } | Export-Csv -Path $exportPath -NoTypeInformation