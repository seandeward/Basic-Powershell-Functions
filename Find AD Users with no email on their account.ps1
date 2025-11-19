<# Find AD Users with no email listed account #>
    # the purpose of this script is to find AD users that do not have an email address listed in their account
$ADUsers = Get-ADUser -Filter * -Properties Name, EmailAddress | Select-Object Name, EmailAddress

foreach ($user in $ADUsers) {
    $name = $user | Select-Object -ExpandProperty Name
    $email = $user | Select-Object -ExpandProperty EmailAddress
    if ($email.count -eq 0) {
        Write-Host "$name has no email.$email" -ForegroundColor Yellow
    } elseif ($email.count -eq 1) {
        Write-Host "$name has $email" -ForegroundColor Green
    } else {
        Write-Host "There was an error in handling $name's info.$email" -ForegroundColor Red
    }
}