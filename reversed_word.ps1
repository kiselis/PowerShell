# A script to write a supplied word from the other side
# Usage: .\reversed_word.ps1 -word Paris
# Word from the other side: siraP

# Parameterized variable is set

param (
    [string]$word
)

# Cheking if a word has been supplied
if (-not $word) {
    Write-Host "Enter the word you want to see written from another side"
    exit 1
}

# Reversing the supplied word
$reversed_word = -join $word[-1..-($word.Length)]

# Printing out the reversed word
Write-Host "Word from the other side: $reversed_word"
