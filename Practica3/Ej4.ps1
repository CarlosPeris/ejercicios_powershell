[double]$num1 = Read-Host "Dame el primer número"
[double]$num2 = Read-Host "Dame el segundo número"
[int]$operacion = Read-Host " `n 1.Sumar `n 2.Restar `n 3.Multiplicar `n 4.Dividir `n ¿Que operación quieres hacer?"

Switch ($operacion) {
    1 {
        $res = $num1 + $num2
        Write-Host "La suma es $res"
    }
    2 {
        $res = $num1 - $num2
        Write-Host "La resta es $res"
    }
    3 {
        $res = $num1 * $num2
        Write-Host "La multiplicación es $res"    
    }
    4 {
        $res = $num1 / $num2
        Write-Host "La división es $res"    
    }
    default {
        Write-Host "Elige una de las 4 opciones"
    }
}
