[int]$num = Read-Host "Dime un número" 
[string]$res = ""

for ($i = 1; $i -le $num; $i++) {
    $res = $res += "*"
    Write-Host "$res"
}

<# **Otra forma de hacerlo**

for ($i; $i -le $altura; $i++) {
    
    for ($j = 1; $j -le $i; $j++) {

        Write-Host -NoNewLine "*"
    }
    Write-Host " "
}
#>