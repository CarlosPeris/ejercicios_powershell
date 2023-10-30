﻿Import-Module ActiveDirectory
$empleados = Import-Csv C:\Users\Administrador\Desktop\archivos\empleados.csv -delimiter ";"


# Creamos la carpeta Empresa_Users
New-Item -Path C:\Empresa_Users -ItemType Directory


# Compartimos la carpeta en modo oculto
New-SmbShare -Name Empresa_Users$ -Path C:\Empresa_Users -FullAccess "Usuarios del dominio"

foreach ($emp in $empleados) {
    $nombre = $emp.nombre
    $apellido = $emp.apellido
    $usuario = "$nombre $apellido"
    $ruta = "C:\Empresa_Users\$usuario"
    
    New-Item -Path $ruta -ItemType Directory
}


# Permisos NTFS de las carpetas
foreach ($emp in $empleados)
{
    $acl = Get-Acl -Path C:\Empresa_Users\"$($emp.nombre) $($emp.apellido)"

    # Deshabilitar la herencia y eliminar TODAS las reglas de acceso
    $acl.SetAccessRuleProtection($true,$false)

    $permisos = 'Administradores','FullControl','ContainerInherit,ObjectInherit','None','Allow'
    $ace = New-Object System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisos
    $acl.SetAccessRule($ace)

    $permisos = "$($emp.nombre) $($emp.apellido)",'FullControl','ContainerInherit,ObjectInherit','None','Allow'
    $ace = New-Object System.Security.AccessControl.FileSystemAccessRule -ArgumentList $permisos
    $acl.SetAccessRule($ace)


    $acl | Format-Table
    Set-Acl -AclObject $acl -Path C:\Empresa_Users\"$($emp.nombre) $($emp.apellido)"
}

# Compartimos la carpeta del departamento a cada usuario y la suya propia
foreach ($emp in $empleados) {
    Set-ADUser -Identity "$($emp.nombre) $($emp.apellido)" -ScriptPath "carpetas$($emp.departamento).bat" -HomeDrive "Z:" -HomeDirectory "\\empresa-dc1\Empresa_Users$\$($emp.nombre) $($emp.apellido)"
}

# Creamos el perfil móvil para los usuarios del departamento PERSONAL
foreach ($emp in $empleados){
    if ($($emp.departamento) -eq "PERSONAL"){
        Set-ADUser -Identity "$($emp.nombre) $($emp.apellido)" -ProfilePath "\\empresa-dc1\Empresa_Users$\$($emp.nombre) $($emp.apellido)"
    }
}