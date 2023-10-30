[int]$adivina = 71
$num = ""

while ($num -ne $adivina) {
    [int]$num = Read-Host "Adivina un número del 0 al 100"
  
    if ($num -lt $adivina) {
        Write-Host "Fallaste! El número es mayor"
    }
    else {
        Write-Host "Fallaste! El número es menor"
    }
}

Write-Host "Enhorabuena! El número es correcto"