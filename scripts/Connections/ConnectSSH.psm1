function connectSsh{
    param (
    $configuraciones,$arguments,$argumentsExtra,$NameCred
    )
    #----CONFIG-------
    #$configuraciones = Get-Content -Raw -Path .\config.json | ConvertFrom-Json
    $credenciales=$configuraciones.credenciales.$NameCred

    $servidor = $credenciales.Servidor
    $usuario = $credenciales.Usuario
    $puerto = $credenciales.Puerto
    $nameKey = $credenciales.nameKey
    $directorios = $configuraciones.directorios
    $dire = $directorios.PrivateKeyDir
    $sshDir=$directorios.ssh
    #-----------------

    $sshCommandArgs = @()
    if($arguments -ne "null"){
        $arg="-"+$arguments
        $sshCommandArgs+=$arg
    }
    if($namekey.Trim().Length -ne 0){
        $sshCommandArgs += "-i"
        $sshCommandArgs += $nameKey
    }
    $sshCommandArgs += "$usuario@$servidor"
    $sshCommandArgs += "-p"
    $sshCommandArgs += $puerto
    if($argumentsExtra -ne "null"){
        $argumentosArray = $argumentsExtra -split ' '
        $sshCommandArgs +=$argumentosArray
    }

    #-----------------------------------
    if($namekey.Trim().Length -ne 0){
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
            $global:ResultText.Text="The key permissions were changed for its correct operation..."
            Start-Process -FilePath 'icacls' -ArgumentList "$nameKey /reset" -WindowStyle Hidden -Wait | Out-Null #reseteo los permisos
            Start-Process -FilePath 'icacls' -ArgumentList "$nameKey /inheritance:r /grant $($env:USERNAME):(R)" -WindowStyle Hidden -Wait | Out-Null #le cambia los permisos a solo lectura(R), equivalente a chmod 400 en linux
           
        }
    }

    #Write-Host "$sshDir\ssh.exe $sshCommandArgs"
    Start-Process -FilePath "$sshDir\ssh.exe" -ArgumentList $sshCommandArgs 
   
   
    #Read-Host "Pulse una tecla para cerrar"

}

Export-ModuleMember -Function connectSsh