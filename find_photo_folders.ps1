# This script should find all folders containing at least one photo

# Specify Path
$Folder = "C:\Path\To\Folder"

# Function to check if the file is a picture
function IsImageFile($filePath) {
    $imageExtensions = @(".jpg", ".jpeg", ".png", ".gif", ".bmp")
    $extension = [System.IO.Path]::GetExtension($filePath).ToLower()

    return $imageExtensions.Contains($extension)
}

# Function to search for picture files recursively
function FindImageFolders($folderPath) {
    $imageFolders = @()

    # Checking each file in the folder
    Get-ChildItem -Path $folderPath -Directory | ForEach-Object {
        $subFolderPath = $_.FullName

        # Checking if there are picture files in the folder
        if (Get-ChildItem -Path $subFolderPath -File | Where-Object { IsImageFile($_.FullName) }) {
            $imageFolders += $subFolderPath
        }

        # Recursively searching in subfolders
        $imageFolders += FindImageFolders $subFolderPath
    }

    return $imageFolders
}

# Looking for folders with picture files
$ImageFolders = FindImageFolders $Folder

# Printing out the result
$ImageFolders | ForEach-Object {
    Write-Output $_
}
