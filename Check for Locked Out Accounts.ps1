<# Check for locked out AD Users #>
Clear-Host

$lockedOutUsers = Get-ADUser -Filter * -Properties LockedOut | Where-Object -Property ('LockedOut' -eq 'true')

if ($lockedOutUser.count -eq 0){
    Write-Host "There are no locked out accounts."
} else {
    Write-Host "$lockedOutUsers is locked out."
}