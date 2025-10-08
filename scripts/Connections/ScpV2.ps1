param (
 $Parametro
)

#----CONFIG-------
#$configuraciones = Get-Content -Raw -Path .\config.json | ConvertFrom-Json  #puedo anular la carga por que este codigo se ejecuta en la misma instancia que el main
#$string =$Parametro
$credenciales = $configuraciones.credenciales.$Parametro

$servidor = $credenciales.Servidor
$usuario = $credenciales.Usuario
$puerto = $credenciales.Puerto
$nameKey = $credenciales.nameKey
$directorios = $configuraciones.directorios
$dire = $directorios.PrivateKeyDir
$sshDir=$directorios.ssh
$pathToTransfer="${usuario}@${servidor}:~/"
#Add-Type -AssemblyName System.Windows.Forms
#Add-Type -AssemblyName System.Drawing
#---------------------------------
# Crear el objeto OpenFileDialog
$openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
$openFileDialog.Title = "Seleccionar Archivo"
$openFileDialog.Filter = "Todos los archivos (*.*)|*.*"
$openFileDialog.Multiselect = $false  

# Mostrar el cuadro de di�logo y verificar si el usuario hizo clic en "Aceptar"

$ResultText.Text= "Seleccione un archivo para continuar"
if ($openFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    # Obtener la ruta completa del archivo seleccionado
    $archivoSeleccionado = $openFileDialog.FileName

    # Verificar si el archivo seleccionado es un directorio
    if ((Get-Item $archivoSeleccionado).PSIsContainer) {
        $ResultText.Text= "La seleccion no es un archivo valido. Selecciona un archivo, no un directorio."
       
    } else {
        $ResultText.Text= "Copiando '$archivoSeleccionado'..Espere"
        if($namekey.Trim().Length -eq 0){
            $argumentos =@("-P${puerto}","$archivoSeleccionado",$pathToTransfer)
            Start-Process -FilePath "$sshDir\scp.exe" -ArgumentList $argumentos 
        }else{
            $argumentos=@("-P${puerto}","-i",$nameKey,"$archivoSeleccionado",$pathToTransfer)
            # Verificar permisos
            $acl = Get-Acl -Path $nameKey
            $setearPermisos=$false   
            foreach ($accessRule in $acl.Access) {
                if ( $accessRule.IdentityReference.Value.Split('\')[-1] -ne $env:USERNAME -or $accessRule.FileSystemRights -notlike "Read,*" ){
                    $setearPermisos=$true
                }
            }
            #-----------------------------------------------
            
            if($setearPermisos){
                $ResultText.Text= "Advertencia: La llave contiene permisos no deseados."
                $ResultText.Text= "Cambiando permisos a solo LECTURA para su correcto funcionamiento..."
                icacls $nameKey /reset | Out-Null #reseteo los permisos
                icacls $nameKey /inheritance:r /grant "$($env:USERNAME):(R)" | Out-Null #le cambia los permisos a solo lectura(R), equivalente a chmod 400 en linux
                if($LASTEXITCODE -eq 0){
                    Start-Process -FilePath "$sshDir\scp.exe" -ArgumentList $argumentos 
                }else{ 
                    $ResultText.Text= "No se han podido cambiar los permisos del archivo"
                }
             }else{
                Start-Process -FilePath "$sshDir\scp.exe" -ArgumentList $argumentos 
            }
        }
        if($LASTEXITCODE -gt 0){
             $ResultText.Text="Error en la copia, Esp codigo de error $LASTEXITCODE "
             
        }else{
             $ResultText.Text= "Scp lanzado..."
             
        }
    }
} else {
    $ResultText.Text= "No se selecciono ningun archivo."
    
}

