# Display menu and get user choice
Write-Host "Choose an option:"
Write-Host "1. List contents of a directory"
Write-Host "2. Create a file"
$choice = Read-Host "Enter your choice (1 or 2)"

# Perform action based on user choice
switch ($choice) {
    1 {
        # Get directory path from user
        $path = Read-Host "Enter the directory path"
        
        # List directory contents
        Get-ChildItem $path
    }
    2 {
        # Get file name and contents from user
        $name = Read-Host "Enter the file name"
        $content = Read-Host "Enter the file contents"
        
        # Create file
        Set-Content -Path $name -Value $content
    }
    default {
        Write-Host "Invalid choice. Please enter 1 or 2."
    }
}
