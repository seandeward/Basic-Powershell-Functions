# How to Enable / Disable a Active Directory Account
$ADUsername = "" #AD User Account name
Enable-ADAccount $ADUsername # Run this to Enable the AD User account
Disable-ADAccount $ADUsername # Run this to Disable the AD User account

# Note: You can run the command through a pipe like this:
Get-ADUser -Identity $ADUsername | Enable-ADAccount
# but it would take more resources to do so, as it would pull all of that users data first, *then* Enabling them, rather than just immediately disabling them, which is good to keep in mind if you're going to Enable/Disable a good batch of users.