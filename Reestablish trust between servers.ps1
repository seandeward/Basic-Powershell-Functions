# for issues with a computer working with the domain controller
$serverName = "" # input server hostname here
Reset-ComputerMachinePassword -Server $serverName # or other target server name (from the machine you're fixing)
    # reestablishes trust between problem server and the Domain Controller