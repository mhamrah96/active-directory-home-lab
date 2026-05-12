Import-Module ActiveDirectory

$users = @(
    "John.Smith",
    "Sarah.Jones",
    "Mike.Brown",
    "Emily.Davis",
    "Chris.Wilson",
    "John.Doe",
    "Ryder.Matt",
    "Frank.Paul",
    "Mary.Washington",
    "Omar.Phil"
)

foreach ($user in $users) {

    $password = ConvertTo-SecureString "Password123!" -AsPlainText -Force

    New-ADUser `
        -Name $user `
        -SamAccountName $user `
        -UserPrincipalName "$user@maindomain.com" `
        -AccountPassword $password `
        -Enabled $true `
        -ChangePasswordAtLogon $true `
        -PasswordNeverExpires $false `
        -Path "OU=IT,DC=maindomain,DC=com"
}
