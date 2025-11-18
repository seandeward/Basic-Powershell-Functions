# Get a numerical count of all AD user accounts in the domain (includes enabled and disabled, as well as every kind of user and every OU)
(Get-AdUser -Filter * | Measure-Object).Count 

# Counting only users in "Users" OU.
$ouPath = ''
(Get-AdUser -Filter * -searchbase $ouPath | Measure-Object).Count

# Counting only ACTIVE users in "Users"
(Get-AdUser -Filter 'enabled -eq "true"' -searchbase $ouPath | Measure-Object).Count