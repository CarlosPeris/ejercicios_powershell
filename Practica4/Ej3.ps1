[int]$num = Read-Host "Dime un número positivo"

$res = ""

for ($i = $num; $i -ge 1; $i--) {
    $res =  $res += "$i, "
}
$res =  $res += "0"

Write-Host "$res"