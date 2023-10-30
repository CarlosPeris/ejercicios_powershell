[int]$num = Read-Host "Dime un número"

for ($i = 1; $i -le $num; $i++) {  #filas

    [string]$res = "" #inicializando aquí $res no voy acumulando el resultado de otras filas

    for ($j = 2*$i-1; $j -ge 1; $j-=2 ) {  #columnas
       
        $res += "$j "
    }
    Write-Host "$res"
}
