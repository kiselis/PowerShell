# Finds the total number of files in disk C
# It may take a few minutes to get the total file count.

$FolderPath = "C:\"

$Files = Get-ChildItem -Path $FolderPath -File -Recurse -ErrorAction SilentlyContinue
if ($Files) {
    $FileCount = $Files.Count
    Write-Host "Total number of files: $FileCount"
} else {
    Write-Host "File count failed"
}
