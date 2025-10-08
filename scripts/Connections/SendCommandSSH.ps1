param (
 $Parametro
)

#----CONFIG-------
$configuraciones = Get-Content -Raw -Path .\config.json | ConvertFrom-Json
$string =$Parametro
$credenciales = $configuraciones.credenciales.$Parametro

$servidor = $credenciales.Servidor
$usuario = $credenciales.Usuario
$puerto = $credenciales.Puerto
$nameKey = $credenciales.nameKey

$directorios = $configuraciones.directorios
$dire = $directorios.PrivateKeyDir
$sshDir=$directorios.ssh
#-----------------
Write-Host "Enviar comando a $usuario"
do{
    $Comando= Read-Host "->"

}while($Comando.Trim().Length -eq 0)

if($namekey.Trim().Length -eq 0){
    & "$sshDir\ssh.exe" $usuario@$servidor -p $puerto $Comando #conectar sin privateKey
}else{
    # Verificar permisos
    $acl = Get-Acl -Path $nameKey
    $setearPermisos=$false   
    foreach ($accessRule in $acl.Access) {
        if ( $accessRule.IdentityReference.Value.Split('\')[-1] -ne $env:USERNAME -or $accessRule.FileSystemRights -notlike "Read,*" ){           
            $setearPermisos=$true
            }
    }

    #--------------------
    if($setearPermisos){
        Write-Host "Advertencia: La llave contiene permisos no deseados."
        Write-Host "Cambiando permisos a solo LECTURA para su correcto funcionamiento..."
        icacls $nameKey /reset | Out-Null #reseteo los permisos
        icacls $nameKey /inheritance:r /grant "$($env:USERNAME):(R)" | Out-Null #le cambia los permisos a solo lectura(R), equivalente a chmod 400 en linux
        if($LASTEXITCODE -eq 0){
            & "$sshDir\ssh.exe" -i $nameKey $usuario@$servidor -p $puerto $Comando
            }else{ 
                Write-Host "No se han podido cambiar los permisos del archivo"
            }
    }else{
        & "$sshDir\ssh.exe" -i $nameKey $usuario@$servidor -p $puerto $Comando
        }
}

Read-Host "Comando enviado"