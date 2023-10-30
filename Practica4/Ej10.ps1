do {
    Write-Host "`n **ESTE ES EL MENÚ** `n 
    a) Crear una carpeta `n
    b) Crear un fichero nuevo `n
    c) Cambiar el nombre de un fichero o carpeta `n
    d) Borrar un archivo o carpeta `n
    e) Verificar si existe un fichero o carpeta `n
    f) Mostrar el contenido de un directorio. `n
    g) Mostar la fecha y hora actuales `n
    x) Salir `n"

    [string]$opcion = Read-Host "Dime que opción del menú quieres" 

    switch ($opcion) {
        "a" {
            [string]$name = Read-Host "Como se llama la carpeta?"
            New-Item $name -ItemType Directory
        }
        "b" {
            [string]$name = Read-Host "Como se llama el fichero?"
            New-Item $name -ItemType File
        }
        "c" {
            [string]$name = Read-Host "Como se llama la carpeta o fichero?"
            [string]$new = Read-Host "Que nombre le quieres poner?"
            Rename-Item $name -NewName $new
        }
        "d" {
            [string]$name = Read-Host "Dime la ruta"
            Remove-Item -Path $name -Recurse 
        }
        "e" {
            [string]$name = Read-Host "Dime la ruta"
            If (Test-Path -Path $name) {
                Write-Host "Existe!"
            }
            Else {
                Write-Host "No existe"
            }
        }
        "f" {
            [string]$name = Read-Host "Dime la ruta"
            Get-ChildItem -Path $name
        }
        "g" {
            Get-Date
        }
        "x" {
            Write-Host "Bye bye"
            exit
        }
        default {
            Write-Host "Esa opción no existe"
        }
    }
}
while ($opcion -ne "x")
