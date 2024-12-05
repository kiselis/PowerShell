# Function to list the files created or modified within specified number of days
# Usage: Get-NewFiles C:\ 10

param (
        [string]$folder,
        [int]$days
    )

function Get-NewFiles {
    param (
        [string]$folder,
        [int]$days
    )

    $cutoffDate = (Get-Date).AddDays(-$days)

    $files = Get-ChildItem -Path $folder -Recurse | Where-Object { $_.LastWriteTime -gt $cutoffDate } | Sort-Object LastWriteTime -Descending

    if ($files) {
        Write-Host "Files created or change within $days days:"
        foreach ($file in $files) {
            $formattedDate = $file.LastWriteTime.ToString("yyyy-MM-dd HH:mm")
            Write-Host "$($file.FullName) - $formattedDate"
        }
    }
    else {
        Write-Host "No new or modified files found within $days days."
    }
}

# Calling function
Get-NewFiles -folder $folder -days $days
