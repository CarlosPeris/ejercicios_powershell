[double]$horas = Read-Host "¿Cuántas horas has trabajado?"
[double]$coste = Read-Host "¿A cuánto cobras la hora?"
$res = $horas * $coste
Write-Host "Tu salario es de" $res "€"