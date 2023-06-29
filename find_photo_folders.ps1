# Script to find folders with pictures

# Specify path
$Folder = "C:\Path\To\Folder"

# Searching for all folders which contain at least one picture file
$PictureFolders = Get-ChildItem -Path $Folder -Recurse -Directory |
                    Where-Object { (Get-ChildItem -Path $_.FullName -File -Include *.jpg, *.gif, *.png).Count -gt 0 } |
                    Select-Object -ExpandProperty FullName

# Printing out the result
$PictureFolders | ForEach-Object {
    Write-Output $_
}