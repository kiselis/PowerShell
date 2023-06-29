# This script should find top biggest files in specified folder and its subfolders

# Specify Path
$FolderPath = "C:\Path\To\Folder"

# Fetches the list of all files in the folder and subfolders
$Files = Get-ChildItem -Path $FolderPath -Recurse -File

# Finds 5 biggest files by size
$TopFiles = $Files | Sort-Object -Property Length -Descending | Select-Object -First 5

# Prints out the result
$TopFiles | ForEach-Object {
    Write-Output "File: $($_.FullName), Size: $($_.Length) bytes"
}
