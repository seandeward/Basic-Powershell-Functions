### POWERSHELL DAILY REPORT - Admin Account Creation ###
# This is an older version of a Domain Admin Account Creation script that I made. The newer version sends an email using an SMTP Relay server. This is a version that sends a notification and exports a script to a file path of your choosing.
    # Script checks for any AD User accounts that are in the "Domain Admin" group and have been added 30 days before today's date.
    # If 0 such accounts are detected, a Windows Shell pop up will alert user that no such account have been created.
    # If anything other than 0 such accounts are detected, a .csv will be exported, detailing the Accounts Name, SamAccountName, and date/time of creation. Script will then 

# VARIABLES TO INPUT
$domainAdminsIdentity = "" # replace with the name of your Domain Admins group that you want to check
$filePath = "" # File path of the final .csv to be exported at the end of the script.

# Clear Terminal for visibility
Clear-Host
    # Get list of accounts in the "Domain Admins" group, gets the whenCreated property of each user in that group, and then filters list for users that have a whenCreated date that is greater than 30 days before today's date. Results are stored in the $domainAdmins variable
    $domainAdmins = Get-ADGroupMember -Identity $domainAdminsIdentity | Get-ADUser -Properties whenCreated | Where-Object { $_.whenCreated -gt (Get-Date).AddDays(-30) }

    # if the number of users equals 0, the message below will be displayed in a Windows Shell popup.
    if ($domainAdmins.Count -eq 0) {
            # clarifies what the windows shell is
            $wshell = New-Object -ComObject Wscript.Shell
            # creates a windows popup with the message below
            $Output = $wshell.popup("<<Admin Creation - Daily Check-In>>
            No Domain Admins have been created in the past 30 days.")
    }
        # if the number of users does not equal 0, the script will:
        else {

            # listing the export path to send out a .csv of the results
            $exportPath = "C:\Users\sdeward\OneDrive - Life EMS Ambulance\Desktop\New-Admins_$(Get-Date -Format 'yyyy-MM-dd').csv"

            # Export data to a CSV file, and have the CSV file named with the current date
            $domainAdmins | Select-Object Name, SamAccountName, whenCreated | Export-Csv -Path $exportPath -NoTypeInformation

            # clarifies what the windows shell is
            $wshell = New-Object -ComObject Wscript.Shell
            # creates a windows popup with the message below
            $Output = $wshell.popup("<<ALERT>>
            Domain Admins have been created in the past 30 days. A .csv has been exported to $exportPath.
            The file will automatically open after the closure of this window.")

            # after user hits "Ok" or "X"s out of the Windows Shell that was created...

            # automatically opens the .csv file that was just created after hitting "Ok" 
            Start-Process -FilePath "$exportPath"
        }

# clears terminal for visibility
Clear-Host

# You can set this up with Task Scheduler to have it run as often as you want, depending on how 