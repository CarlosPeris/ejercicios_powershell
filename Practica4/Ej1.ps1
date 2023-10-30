[string]$name = Read-Host "¿Cuál es tu usuario?"
[int]$num = Read-Host "Dime un número"

for ($i = 1; $i -le $num; $i++) {
    Write-Host "$name"
}