[int]$edad = Read-Host "¿Cuantos años tienes?"

if ($edad -lt 4) {
    Write-Host "Entrada gratis!"
}
elseif ($edad -gt 18) {
    Write-Host "Precio: 10€"
}
else {
    Write-Host "Precio: 5€"
}