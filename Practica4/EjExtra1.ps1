﻿[int]$num = Read-Host "Dime un número"

for ($i = 1; $i -le $num; $i++) {  #filas

    [string]$res = "" #inicializando aquí $res no voy acumulando el resultado de otras filas

    for ($j = $i; $j -ge 1; $j-- ) {  #columnas
       
        $res += "$j "
    }
    Write-Host "$res"
}

