# Host and Virtual Machine testing Script
# Jayden Houghton
 
# Note: the following command may need to be run and accepted to allow 
# scripts to be run on a new machine
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
 
 
# <========= Main Program =========>
 
$stop = $false
 
do {
    # Display menu and get user choice
    Write-Host ""
    Write-Host "Choose option:"
    Write-Host "1. Display network configuration"
    Write-Host "2. List virtual machines"
    Write-Host "3. Test connectivity with a machine"
    Write-Host "4. End program"
    Write-Host ""
    $choice = Read-Host "Enter your choice (1, 2, 3 or 4)"
    Write-Host ""
 
    # Perform action based on user choice
    switch ($choice) { 
        1 { 
            # Display network configuration 
            Get-NetIPConfiguration | Out-String 
            # Out string waits for string output to continue
            $wait = Read-Host "Press enter to continue..." 
        } 
 
        2 { 
            # List the virtual machines in the private subnet 
            Get-VM | Out-String 
            # Get-VM has no parameters so uses local host
            # Out string waits for string output to continue
            $wait = Read-Host "Press enter to continue..."
        } 

        3 {
            # Test connection with a machine 
            Write-Host "Enter a IP address to ping or 'exit' to return to the main menu"  
            $choice = Read-Host "IP address" 
            switch ($choice) { 
                "exit" { 
                } 
                default { 
                    Write-Host ""
                    Write-Host "Please wait, this may take some time."
                    Test-Connection $choice 
                    Write-Host ""
                    $wait = Read-Host "Press enter to continue..."
                }
            } 
        }
 
        4 {
            # Exit program
            $stop = $true
        }
    }
         
    default { 
        # Handle invalid inputs
        Write-Host "Invalid choice. Please enter 1, 2 or 3." 
    }
} until ($stop)
