[int]$num = Read-Host "Dime un número positivo"

$res = ""

for ($i = 1; $i -lt $num; $i+=2) {
    $res =  $res += "$i, "
}
$res =  $res += "$num"

Write-Host "$res"