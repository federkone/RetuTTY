param (
 $Parametro,$arguments,$nameCandidate,$rutadestinokey,$send
)

#----CONFIG-------
$configuraciones = Get-Content -Raw -Path .\config.json | ConvertFrom-Json
$credenciales = $configuraciones.credenciales.$Parametro
$servidor = $credenciales.Servidor
$usuario = $credenciales.Usuario
$puerto = $credenciales.Puerto
#$nameKey = $credenciales.nameKey
$directorios = $configuraciones.directorios
$dire = $directorios.PrivateKeyDir
$sshDir=$directorios.ssh
#-----------------

$argumentosArray = $arguments -split ' '
& "$sshDir\ssh-keygen.exe" $argumentosArray 
$exitCode = $LastExitCode
    
$stringName="$dire\$nameCandidate.pub" 

$command="cat >> $rutadestinokey"   

if($send -eq "True"){     
        Write-Host "Aplicando llave publica al sevidor en '$rutadestinokey'.."
        $command=type $stringName | & "$sshDir\ssh.exe" $usuario@$servidor -p $puerto $command 2>&1  
        Write-Host $command
        $exitCode = $LastExitCode
        
        if($exitCode -eq 0){
                Write-Host "Llave enviada al servidor con Exito"
                #Remove-Item -Path $stringName -Force
                $credenciales.nameKey = "$dire\$nameCandidate"
                $configuraciones | ConvertTo-Json | Set-Content -Path .\config.json 
                Write-Host "credenciales actualizadas[config.json] con namekey='$nameCandidate'"
        }else{ Write-Host "Error al enviar la llave publica al servidor"}
}
 

Read-Host "Pulsa tecla para Finalizar"