[int]$var1 = Read-Host "Dame un número"
[int]$var2 = Read-Host "Dame otro número"
$res = $var1 + $var2
Write-Host "El resultado de" $var1 "+" $var2 "es" $res
$res = $var1 - $var2
Write-Host "El resultado de" $var1 "-" $var2 "es" $res
$res = $var1 * $var2
Write-Host "El resultado de" $var1 "*" $var2 "es" $res
$res = $var1 / $var2
Write-Host "El resultado de" $var1 "/" $var2 "es" $res
$res = $var1 % $var2
Write-Host "El resultado de" $var1 "%" $var2 "es" $res