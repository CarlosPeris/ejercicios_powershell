$usuarios = Import-Csv Z:\usuarios.csv -Delimiter ","

foreach ($us in $usuarios) {
    Write-Host "Usuario: $($us.nombre) $($us.apellidos) $($us.grupo)"

}