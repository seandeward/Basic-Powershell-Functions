# List all locked out users
Get-ADUser -filter * -Properties LockedOut | Where-Object LockedOut -eq "True" | Format-Table Name, LockedOut -AutoSize