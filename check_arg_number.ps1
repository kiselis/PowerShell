# Checks how many arguments were provided to the script (1, 2, 3 or other number)

$argNumber = $args.Length

if ($argNumber -eq 1) {
    Write-Host "1 argument provided"
} elseif ($argNumber -eq 2) {
    Write-Host "2 arguments provided"
} elseif ($argNumber -eq 3) {
    Write-Host "3 arguments provided"
} else {
    Write-Host "ERROR: wrong number of arguments provided"
}
