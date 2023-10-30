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

# Permisos NTFS de los departamentos
foreach ($dep in $listadep) {

    $acl = Get-Acl -Path C:\Empresa\$($dep.departamento)

    # Deshabilitar la herencia y eliminar TODAS las reglas de acceso
    $acl.SetAccessRuleProtection($true, $false)

    $permisos = 'Administradores','FullControl','ContainerInherit, ObjectInherit','None','Allow'
    $ace = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisos
    $acl.SetAccessRule($ace)

    $permisos = "$($dep.departamento)",'Modify','ContainerInherit, ObjectInherit','None','Allow'
    $ace = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisos
    $acl.SetAccessRule($ace)

    $permisos = 'Usuarios del dominio','Read','ContainerInherit, ObjectInherit','None','Allow'
    $ace = New-Object -TypeName System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisos
    $acl.SetAccessRule($ace)
   
    Set-Acl -Path C:\Empresa\$($dep.departamento) -AclObject $acl

}



