# Display menu and get user choice
Write-Host "Choose an option:"
Write-Host "1. Display network configuration"
Write-Host "2. List virtual machines"
Write-Host "3. Test connection with a machine"
$choice = Read-Host "Enter your choice (1, 2 or 3)"

# Perform action based on user choice
switch ($choice) {
    1 {
        # Display network configuration
        Get-NetIPConfiguration
        # https://www.pdq.com/blog/what-is-the-powershell-equivalent-of-ipconfig/
    }
    2 {
        # List the virtual machines in the private subnet

        

    }
    3 {
        # Test connection with a machine
        Write-Host ""
        Write-Host "Enter a ip address to ping or 'exit' to return to the main menu"
        $loop = $true
        while ($loop) {
            $choice = Read-Host "Enter the ip address"
            switch ($choice) {
                "exit" {
                    $loop = $false
                }
                default {
                    Test-Connection $choice
                    $loop = $false
                }
            }
        }

        # https://www.educba.com/powershell-ping/#:~:text=The%20PowerShell%20ping%20command%20is,and%20also%20by%20using%20the
    }
    default {
        Write-Host "Invalid choice. Please enter 1, 2 or 3."
    }
}
