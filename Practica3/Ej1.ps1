[int]$num = Read-Host "Dame un número"

If ($num % 2 -eq 0) {
    Write-Host "El número" $num "es par"
}
Else {
    Write-Host "El número" $num "es impar"
}