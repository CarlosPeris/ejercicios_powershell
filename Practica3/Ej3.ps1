[int]$num1 = Read-Host "Dame el primer número"
[int]$num2 = Read-Host "Dame el segundo número"

If ($num1 -gt $num2) {
    Write-Host "El número $num1 es mayor a $num2"
}
ElseIf ($num1 -eq $num2) {
    Write-Host "El número $num1 es igual a $num2"
}
Else {
    Write-Host "El número $num1 es menor a $num2"
}
