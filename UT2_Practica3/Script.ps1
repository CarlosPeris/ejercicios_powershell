#Creamos la Unidad Organizativa "Empresa"
New-ADOrganizationalUnit -Name "Empresa" -Path "DC=EMPRESA,DC=LOCAL"

#Importamos los datos de los archivos
$depart = Import-Csv -Path C:\Users\Administrador\Desktop\archivos\departamentos.csv -Delimiter ';'
$empleados = Import-Csv -Path C:\Users\Administrador\Desktop\archivos\empleados.csv -Delimiter ';'

#Recorremos y almacenamos cada departamento con su descripción
foreach ( $i in $depart) {
    #Guardamos los datos en las variables
    $nomdepart = $i.departamento
    $descrip = $i.descripcion

    #Creamos una Unidad organizativa por cada departamento
    New-ADOrganizationalUnit -Name $nomdepart -Description $descrip -Path "OU=Empresa,DC=EMPRESA,DC=LOCAL"

    #Creamos el grupo de seguridad de ámbito global de cada UO
    New-ADGroup -Name $nomdepart -GroupCategory Security -GroupScope Global -Path "OU=$nomdepart,OU=Empresa,DC=EMPRESA,DC=LOCAL"
}

#Recorremos y almacenamos cada usuario en su departamento con su nombre y apellido
foreach ( $usuario in $empleados) {
    #Guardamos los datos en las variables
    $nomdepart = $usuario.departamento
    $nombre = $usuario.nombre
    $apellido = $usuario.apellido
 
    #Creamos los usuarios y sus grupos del departamento
    New-ADUser -Name "$nombre $apellido" -Path "OU=$nomdepart,OU=Empresa,DC=EMPRESA,DC=LOCAL" -AccountPassword (ConvertTo-SecureString "aso2021." -AsPlainText -Force)  -GivenName $nombre -Surname $apellido -ChangePasswordAtLogon $true -Enabled $true

    #Añadimos cada usuario a su departamento
    Add-ADGroupMember -Identity $nomdepart -Members "$nombre $apellido"
} 
Write-Host "Completado. Todo ha funcionado correctamente!"