# Creamos el directorio padre
New-Item -Path C:\Empresa -ItemType Directory

$listadep = Import-Csv -Path C:\Users\Administrador\Desktop\archivos\departamentos.csv -Delimiter ';'

# Creamos los directorios para los departamentos
foreach ($dep in $listadep) {
    $nombredep = $dep.departamento
    New-Item -Path C:\Empresa\$nombredep -ItemType Directory
}

# Compartir los departamentos
foreach ($dep in $listadep) {
    $nombredep = $($dep.departamento)
    New-SmbShare -Path C:\Empresa\$nombredep -Name $nombredep -FullAccess $nombredep  

    # Dar permisos a los departamentos
    Grant-SmbShareAccess -Name $nombredep -AccountName $nombredep -AccessRight Change -Force
    Grant-SmbShareAccess -Name $nombredep -AccountName "Administradores" -AccessRight Full -Force
    Grant-SmbShareAccess -Name $nombredep -AccountName "Usuarios del dominio" -AccessRight Read -Force
    Revoke-SmbShareAccess -Name $nombredep -AccountName "Todos" -Force
}


