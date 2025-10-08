function sftp{
    param (
    $configuraciones,$NameCred
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

    #$sfptDir=".\WinSCP"
    if(-not (Test-Path -Path "$namekey.ppk" -PathType Leaf) -and (Test-Path -Path "$namekey" -PathType Leaf)){
       $proceso= Start-Process -FilePath "./WinSCP/WinSCP.exe" -ArgumentList "/keygen $namekey /output=$namekey.ppk" 
        
    }
    
    Start-Process -FilePath "./WinSCP/WinSCP.exe" -ArgumentList "sftp://${usuario}@${servidor}:${puerto}/ /privatekey=$nameKey.ppk" 

    
}

Export-ModuleMember -Function sftp