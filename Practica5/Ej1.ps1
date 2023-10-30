Function Sumar {
    param (
        [double]$x,
        [double]$y
    )
    $sumar = $x + $y
    Write-Host "El resultado de $x + $y es $sumar"
}

Function Restar {
    param (
        [double]$x,
        [double]$y
    )
    $restar = $x - $y
    Write-Host "El resultado de $x - $y es $restar"
}

Function Multiplicar {
    param (
        [double]$x,
        [double]$y
    )
    $multiplicar = $x * $y
    Write-Host "El resultado de $x * $y es $multiplicar"
}

Function Dividir {
    param (
        [double]$x,
        [double]$y
    )
    $dividir = $x / $y
    Write-Host "El resultado de $x / $y es $dividir"
}

do {

[int]$operacion = Read-Host " `n ****** CALCULADORA ****** `n 1.Sumar `n 2.Restar `n 3.Multiplicar `n 4.Dividir `n 5.Salir `n ¿Qué desea hacer? Elige una opción"

if ($operacion -ne 5) {
    [double]$x = Read-Host "`nDame el primer número"
    [double]$y = Read-Host "Dame el segundo número"
}

    Switch ($operacion) {
        1 {
            Sumar $x $y
        }
        2 {
            Restar $x $y
        }
        3 {
            Multiplicar $x $y
        }
        4 {
            Dividir $x $y
        }
        5 {
            Write-Host "`nChao"
            exit
        }
        default {
            Write-Host "Elige una de las 5 opciones"
        }
    }
}
while ($operacion -ne 5)