Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

$Form                            = New-Object system.Windows.Forms.Form
$Form.ClientSize                 = New-Object System.Drawing.Point(1050,1000)
$Form.text                       = "SSH Toolbox By Nullplague"
$Form.StartPosition              = "CenterScreen"
$Form.TopMost                    = $false
$Form.BackColor                  = [System.Drawing.ColorTranslator]::FromHtml("#f0f0f0")
$Form.AutoScaleDimensions     = '192, 192'
$Form.AutoScaleMode           = "Dpi"
$Form.AutoSize                = $False
$Form.MinimumSize = New-Object System.Drawing.Size(685, 386)
$Form.MaximumSize = New-Object System.Drawing.Size(685, 386)
$Form.AutoScroll              = $False
$Form.ClientSize              = '1050, 1000'
$Form.FormBorderStyle         = 'FixedSingle'
$Form.MaximizeBox = $false


# GUI Icon
$iconBase64                      = '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'
$iconBytes                       = [Convert]::FromBase64String($iconBase64)
$stream                          = New-Object IO.MemoryStream($iconBytes, 0, $iconBytes.Length)
$stream.Write($iconBytes, 0, $iconBytes.Length)
$Form.Icon                    = [System.Drawing.Icon]::FromHandle((New-Object System.Drawing.Bitmap -Argument $stream).GetHIcon())

$Form.Width                   = $objImage.Width
$Form.Height                  = $objImage.Height

    $SubPanel1                       = New-Object system.Windows.Forms.Panel
    $SubPanel1.BorderStyle           = [System.Windows.Forms.BorderStyle]::Fixed3D
    $subPanel1.BackColor             = [System.Drawing.Color]::White
    $SubPanel1.AutoScroll            = $true
    $SubPanel1.height                = 225
    $SubPanel1.width                 = 218
    $SubPanel1.location              = New-Object System.Drawing.Point(7,31)

   # Width 211 -Height 30

$Panel1                          = New-Object system.Windows.Forms.Panel
$Panel1.height                   = 335
#$Panel1.BorderStyle           = [System.Windows.Forms.BorderStyle]::FixedSingle
$Panel1.width                    = 220
$Panel1.location                 = New-Object System.Drawing.Point(6,1)
<#$Panel1.Add_Paint({
    param($sender, $e)

    $borderColor = [System.Drawing.Color]::Black  # Color del contorno
    $borderWidth = 1  # Ancho del contorno

    # Crear un objeto gráfico para el formulario
    $graphics = $e.Graphics
 
    # Dibujar el contorno alrededor del subpanel
    $pen = New-Object System.Drawing.Pen $borderColor, $borderWidth
    $graphics.DrawRectangle($pen, 0, 30, 219, 228)
})#>




$Label2                          = New-Object system.Windows.Forms.Label
#$Label2.text                     = "Utilities"
$Label2.BorderStyle              = [System.Windows.Forms.BorderStyle]::FixedSingle
$Label2.AutoSize                 = $true
$Label2.width                    = 16
$Label2.height                   = 10
$Label2.location                 = New-Object System.Drawing.Point(7,10)
$Label2.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$Label3                          = New-Object system.Windows.Forms.Label
$Label3.text                     = "Current Status:"
$Label3.BorderStyle              = [System.Windows.Forms.BorderStyle]::FixedSingle
$Label3.AutoSize                 = $true
$Label3.width                   = 16
$Label3.height                  = 10
$Label3.location                = New-Object System.Drawing.Point(255,9)
$Label3.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

$Panel2                          = New-Object system.Windows.Forms.Panel
$Panel2.BorderStyle              = [System.Windows.Forms.BorderStyle]::FixedSingle
$Panel2.BackColor                = [System.Drawing.Color]::White
$Panel2.height                   = 300
$Panel2.width                    = 340
$Panel2.location                 = New-Object System.Drawing.Point(277,31)
<#$Panel2.Add_Paint({
    param($sender, $e)

    $borderColor = [System.Drawing.Color]::Black  # Color del contorno
    $borderWidth = 1  # Ancho del contorno

    # Crear un objeto gráfico para el formulario
    $graphics = $e.Graphics
 
    # Dibujar el contorno alrededor del subpanel
    $pen = New-Object System.Drawing.Pen $borderColor, $borderWidth
    $graphics.DrawRectangle($pen, 0, 0, $Panel2.width - 1, $Panel2.height  - 1)
})#>

<#$Label1                          = New-Object system.Windows.Forms.Label
$Label1.text                     = "Credentials"
#$Label1.BorderStyle              = [System.Windows.Forms.BorderStyle]::FixedSingle
#$Label1.BackColor = [System.Drawing.Color]::White
$Label1.AutoSize                 = $true
$Label1.width                    = 230
$Label1.height                   = 25
$Label1.location                 = New-Object System.Drawing.Point(15,10)
$Label1.Font                     = New-Object System.Drawing.Font('Microsoft Sans Serif',18)
#>


$Panel3                          = New-Object system.Windows.Forms.Panel
$Panel3.height                   = 350
$Panel3.width                    = 300
$Panel3.location                 = New-Object System.Drawing.Point(464,54)

$global:ResultText                      = New-Object system.Windows.Forms.TextBox
#$ResultText.BorderStyle = [System.Windows.Forms.BorderStyle]::Fixed3D
$ResultText.BackColor            = [System.Drawing.Color]::White
$ResultText.ReadOnly             = $true
$ResultText.multiline            = $true
$ResultText.width                = 404
$ResultText.height               = 300
$ResultText.location             = New-Object System.Drawing.Point(245,31)
$ResultText.Font                 = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

<#$Label10                         = New-Object system.Windows.Forms.Label
$Label10.text                    = "Current Status:"
$Label10.AutoSize                = $true
$Label10.width                   = 25
$Label10.height                  = 10
$Label10.location                = New-Object System.Drawing.Point(240,10)
$Label10.Font                    = New-Object System.Drawing.Font('Microsoft Sans Serif',18)
#>
$TextBoxInputDesc = New-Object Windows.Forms.TextBox
$TextBoxInputSv = New-Object Windows.Forms.TextBox
$TextBoxInputUser = New-Object Windows.Forms.TextBox
$TextBoxInputPort = New-Object Windows.Forms.TextBox
$TextBoxInputNamekey = New-Object Windows.Forms.TextBox
$ButtonEdit= New-Object System.Windows.Forms.Button
$ButtonAtras=New-Object System.Windows.Forms.Button
$ButtonAdd= New-Object System.Windows.Forms.Button
    $checkBox11= New-Object Windows.Forms.CheckBox
    $checkBoxC= New-Object Windows.Forms.CheckBox
    $checkBoxK= New-Object Windows.Forms.CheckBox
    $checkBoxRsa= New-Object Windows.Forms.CheckBox
    $checkBoxSendKey= New-Object Windows.Forms.CheckBox
    $TextBoxInputArgument = New-Object Windows.Forms.TextBox
    $comboBox = New-Object Windows.Forms.ComboBox
    $options = "ed25519","rsa","dsa", "ecdsa"
    $comboBox.Items.AddRange($options)
    $comboBox.SelectedIndex = 0
$TextBoxInputArgumentKey= New-Object Windows.Forms.TextBox
$TextBoxInputName = New-Object Windows.Forms.TextBox
$TextBoxInputPass = New-Object Windows.Forms.TextBox
$TextBoxInputbits= New-Object Windows.Forms.TextBox
$TextBoxInputRounds= New-Object Windows.Forms.TextBox
$TextBoxInputDirectory= New-Object Windows.Forms.TextBox
#...............comprobacion de archivo config.json.............................................
function createFile{
    $Estructura = [Ordered]@{

        "--------------------------------Directorios-----------------------------------" =[Ordered] @{};
        "directorios" = [Ordered]@{
            "PrivateKeyDir" = ".\privateKeys";
            "powerDir" = ".\scripts\PowerSv";
            "knockDir" = ".\scripts\knock";
            "conectionSshDir" = ".\scripts\Connections";
            "pingDir" = ".\scripts\Ping";
            "ssh"= ".\OpenSSH-Win64";
        };
        "---------------------Secuencia de puertos utilizados por el servicio Knock---------------" =[Ordered] @{};
        "knock" = [Ordered]@{
            "PortsExample1" = @();
            "PortsExample2" = @();
            "PortsExample3" = @();
            "sleep" = 10;
        };
        "---------------------------------------------------------------------------------" =[Ordered] @{};
        "magicPacket" =[Ordered] @{
                "1"=[Ordered]@{
                    "Descripcion"="Device1";
                    "Mac" = "";
                    "Puerto" = 9;
                    };
                "2"=[Ordered]@{
                    "Descripcion"="Device2";
                     "Mac" = "";
                    "Puerto" = 9;                   
                }
        };
                "-----------------Informacion servidores-------------------" = @{};
        "credenciales"=[Ordered] @{
                    "credenciales1" = [Ordered]@{
                    "Descripcion" = "Empty";
                    "Servidor" = "";
                    "Usuario" = "User";
                    "Puerto" = "Port ssh(def:22)";
                    "nameKey" = "key ssh";
                };
                "credenciales2" = [Ordered]@{
                    "Descripcion" = "Empty";
                    "Servidor" = "";
                    "Usuario" = "User";
                    "Puerto" = "Port ssh(def:22)";
                    "nameKey" = "key ssh";
                };
                "credenciales3" =[Ordered] @{
                    "Descripcion" = "Empty";
                    "Servidor" = "";
                    "Usuario" = "User";
                    "Puerto" = "Port ssh(def:22)";
                    "nameKey" = "key ssh";
                }

        }
        
}
  
    $jsonDatos = $Estructura | ConvertTo-Json
    $jsonDatos = $jsonDatos -replace '(?<=\[\s*)\s*(?=\])', ''

    $jsonDatos | Out-File -FilePath ".\config.json"
     
}

function cargarJson{
            if(Test-Path .\config.json){
           return $configuraciones = Get-Content -Raw -Path .\config.json | ConvertFrom-Json
        }else{
            $ResultText.text = "no se encuentra el archivo ./config.json, Es necesario para el funcionamiento del programa"
 
            createFile
            $ResultText.text = "Archivo inicializado con éxito,ingrese su información 'Editar credenciales'" 
            return  $configuraciones = Get-Content -Raw -Path .\config.json | ConvertFrom-Json             
     
        }

}



#--------------------------------------------------------------------------------------------------

function createButton{
    param([string]$text,[int]$Width,[int]$Height,[int]$X,[int]$Y,$FunctionClick)

    $Button= New-Object System.Windows.Forms.Button
    $Button.Text = $text
    $Button.Width = $Width
    $Button.Height = $Height
    $Button.BackColor = [System.Drawing.ColorTranslator]::FromHtml("#f2f2f2")
    $Button.Location = New-Object System.Drawing.Point($X, $Y)
    $Button.Font = New-Object System.Drawing.Font('Microsoft Sans Serif', 12)
    $ScriptBlock = [scriptblock]::Create($FunctionClick)
    $Button.Add_Click($ScriptBlock)

    return $Button

}

function sftpmodule{
    param($NameCred)
    $ResultText.Text="WinSCP Lanzado..."
    Import-Module "$FILECONNECTION/SftpWinscp.psm1"
    sftp -configuraciones $configuraciones -NameCred $NameCred

}

function IntentarConexionSSH{
        param ($NameCred)
        # Importar el módulo ssh
        Import-Module "$FILECONNECTION/ConnectSSH.psm1"

        $arguments="null"
        $argumentsExtra="null"

        if($checkBox11.Checked -and $checkBoxC.Checked){
            $arguments = "XC"
        }elseif($checkBox11.Checked){
            $arguments = "X"
        }elseif($checkBoxC.Checked){
            $arguments = "C"
        }

        if($TextBoxInputArgument.Text.Trim().Length -ne 0){
                $argumentsExtra =$TextBoxInputArgument.Text        
        }

 

        if($checkBoxK.Checked){
            knockd $NameCred "PuertosOn"
            knockd $NameCred "PuertosOn"
            knockd $NameCred "PuertosOn"
        }

        #Start-Process powershell -ArgumentList @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "./$FILECONNECTION/ConnectSSH.ps1", "-Parametro", $NameCred, "-arguments", $arguments, "-argumentsExtra", "`"$argumentsExtra`"")
       
        connectSsh -configuraciones $configuraciones -arguments $arguments -argumentsExtra $argumentsExtra -NameCred $NameCred
}

function Ping {
    param($NameCred)
    Start-Process powershell -ArgumentList "-File ./$FILEPING/Ping.ps1 -Parametro $NameCred"
    
}

function EjecutarScp{
    param($NameCred)
    . ./$FILECONNECTION/ScpV2.ps1 -Parametro $NameCred 
}

function creationKey{
    param($NameCred)
    
    $directorios = $configuraciones.directorios
    $dire = $directorios.PrivateKeyDir

    $arguments=""
    $arguments+="-t "+$comboBox.SelectedItem

    $start=$false
    if($TextBoxInputPass.Text.Trim().Length -ne 0){
        $pass=$TextBoxInputPass.Text
        $arguments+=" -N "+"`"$pass`""
    }

    if($TextBoxInputbits.Text.Trim().Length -ne 0){
        $arguments+=" -b "+$TextBoxInputbits.Text
    }
    if($TextBoxInputRounds.Text.Trim().Length -ne 0){
        $arguments+=" -a "+$TextBoxInputRounds.Text
    }
    if($TextBoxInputName.Text.Trim().Length -ne 0){
        $nameCandidate=$TextBoxInputName.Text
        $arguments+=" -f $dire/$nameCandidate"
    }
    if($TextBoxInputArgumentKey.Text.Trim().Length -ne 0){
        $arguments+=" "+$TextBoxInputArgumentKey.Text
    }
    if($TextBoxInputDirectory.Text.Trim().Length -ne 0){
        $rutadestinokey=$TextBoxInputDirectory.Text
    }else{$rutadestinokey="null"}

    if($checkBoxSendKey.Checked){
        $send=$true
    }else{ $send=$false}

    #consulto si hay datos validos en los campos obligatorios
    if($checkBoxSendKey.Checked){
        if($TextBoxInputName.Text.Trim().Length -ne 0 -and $TextBoxInputDirectory.Text.Trim().Length -ne 0){
            $start=$true
        }
    }else{
        if($TextBoxInputName.Text.Trim().Length -ne 0){
            $start=$true
            
        }
    }

    if($start){
        Start-Process powershell -ArgumentList @("-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "./$FILECONNECTION/CreationKeys.ps1", "-Parametro", $NameCred, "-arguments", "`"$arguments`"","-nameCandidate",$TextBoxInputName.Text,"-rutadestinokey",$rutadestinokey,"-send",$send) -Wait
        $script:configuraciones=cargarJson #solucionado, cargo la variable global nuevamente ya que en creation keys fue manipulado el json
        $ResultText.Text="Tarea Finalizada"
    }else{$ResultText.Text="Debe completar los campos obligatorios"}
    

}
    
function EncenderModulo {
    param($NameCred,$magicCred)
    $ResultText.text = "Enviando paquete De encendido..."
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File ./$FILEPOWER/PrenderSv.ps1 -Parametro $NameCred -magicCred $magicCred" -Wait -WindowStyle Hidden
    $ResultText.text = "Paquete enviado!"

    <#$totalSeconds = 60

    for ($i = $totalSeconds; $i -ge 0; $i--) {
         $percentComplete = (($totalSeconds - $i) / $totalSeconds) * 100
         Write-Progress -PercentComplete $percentComplete -Status "Proceso..." -Activity "Tiempo estimado $totalSeconds segundos."
         Start-Sleep -Seconds 1
    }#>
}

function SendCommandSSH{
    param($NameCred)

     Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File ./$FILECONNECTION/SendCommandSSH.ps1 -Parametro $NameCred"
}

function knockd{
     param($NameCred,$namePorts)
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File ./$FILEKNOCK/Knock.ps1 -Parametro $NameCred -namePorts $namePorts" -Wait -WindowStyle Hidden
    $credential = $configuraciones.credenciales.$NameCred.Descripcion
    $ResultText.text = "Sequence $namePorts send to $credential"

}

function salir{
    $Form.Close()
}

function ConvertTo-HashTable($object) {
    $hashTable = [Ordered]@{}
    $object.PSObject.Properties | ForEach-Object {
        $hashTable[$_.Name] = $_.Value
    }
    return $hashTable
}

function eliminarCredencial{
        param ($NameCred)

    $credencialesDisponibles = $configuraciones.credenciales

    $credencialesDisponibles.PSObject.Properties.Remove($NameCred)

    $configuraciones | ConvertTo-Json | Set-Content -Path .\config.json

    credencialesForm
}



function guardar{
    param ($NameCred)
    $credencialesDisponibles = $script:configuraciones.credenciales  
    if($NameCred){        
        $credencialesDisponibles.$NameCred = [PSCustomObject]@{
            "Descripcion" = $TextBoxInputDesc.Text;
            "Servidor" = $TextBoxInputSv.Text;
            "Usuario" = $TextBoxInputUser.Text;
            "Puerto" = $TextBoxInputPort.Text;
            "nameKey" = $TextBoxInputNamekey.Text;
        }      
    }else{
        #logica para evitar lagunas de numeracion de credenciales----
        $siguienteNumero = 1
        while ($configuraciones.credenciales."credenciales$siguienteNumero") {
            $siguienteNumero++
        }

        # Crear el nuevo nombre
        $nuevoNombre = "credenciales$siguienteNumero"
        #---------------------------
        # Agregar la nueva credencial
        $credencialesDisponibles | Add-Member -MemberType NoteProperty -Name $nuevoNombre -Value @{
            "Descripcion" = $TextBoxInputDesc.Text
            "Servidor"    = $TextBoxInputSv.Text
            "Usuario"     = $TextBoxInputUser.Text
            "Puerto"      = $TextBoxInputPort.Text
            "nameKey"     = $TextBoxInputNamekey.Text
        }
    }
    $configuraciones | ConvertTo-Json | Set-Content -Path .\config.json 
    credencialesForm
  
}

function KeySelector{
        # Crear el objeto OpenFileDialog
    $openFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $openFileDialog.Title = "Seleccionar Archivo de Llave"
    $openFileDialog.Filter = "Todos los archivos (*.*)|*.*"
    $openFileDialog.Multiselect = $false  

    # Mostrar el cuadro de di�logo y verificar si el usuario hizo clic en "Aceptar"

    $ResultText.text = "Seleccione un archivo para continuar"
    if ($openFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
        # Obtener la ruta completa del archivo seleccionado
        $archivoSeleccionado = $openFileDialog.FileName

        # Verificar si el archivo seleccionado es un directorio
        if ((Get-Item $archivoSeleccionado).PSIsContainer) {
            #$ResultText.text = "La selecci�n no es un archivo v�lido. Selecciona un archivo, no un directorio."
        
        } else {
             $TextBoxInputNamekey.Text="$archivoSeleccionado"
        }

    }
}


function credentialPanel{
    param ($NameCred)

    $credenciales = $configuraciones.credenciales.$NameCred

    $ButtonEdit.Dispose()
    $ButtonAtras.Dispose()
    #$ButtonAdd.Dispose()

    $Panel2.controls.Clear()
    #$Panel1.Controls.Clear()
    #$Form.Controls.Clear()
    #$SubPanel1.controls.Clear()

    
    $ButtonEdit= New-Object System.Windows.Forms.Button
    $ButtonAtras=New-Object System.Windows.Forms.Button


    $labelDesc = New-Object System.Windows.Forms.Label
    $labelDesc.Location = New-Object System.Drawing.Point(20,34)
    $labelDesc.Size = New-Object System.Drawing.Size(70,15)
    $labelDesc.Text = 'Descripcion:'
    $TextBoxInputDesc.Text="$($credenciales.Descripcion)"
    $TextBoxInputDesc.Width = 200
    $TextBoxInputDesc.Height = 20
    $TextBoxInputDesc.Location = New-Object Drawing.Point(100, 32)
   
    $labelSv = New-Object System.Windows.Forms.Label
    $labelSv.Location = New-Object System.Drawing.Point(20,67)
    $labelSv.Size = New-Object System.Drawing.Size(70,15)
    $labelSv.Text = 'Servidor:'
    $TextBoxInputSv.Text="$($credenciales.Servidor)" 
    $TextBoxInputSv.Width = 200
    $TextBoxInputSv.Height = 20
    $TextBoxInputSv.Location = New-Object Drawing.Point(100, 67)

    $labelUser = New-Object System.Windows.Forms.Label
    $labelUser.Location = New-Object System.Drawing.Point(20,102)
    $labelUser.Size = New-Object System.Drawing.Size(70,15)
    $labelUser.Text = 'Usuario:'
    $TextBoxInputUser.Text="$($credenciales.Usuario)" 
    $TextBoxInputUser.Width = 200
    $TextBoxInputUser.Height = 20
    $TextBoxInputUser.Location = New-Object Drawing.Point(100, 102)

    $labelPort = New-Object System.Windows.Forms.Label
    $labelPort.Location = New-Object System.Drawing.Point(20,137)
    $labelPort.Size = New-Object System.Drawing.Size(70,15)
    $labelPort.Text = 'Puerto:'
    $TextBoxInputPort.Text="$($credenciales.Puerto)"
    $TextBoxInputPort.Width = 200
    $TextBoxInputPort.Height = 20
    $TextBoxInputPort.Location = New-Object Drawing.Point(100, 137)

    $labelKey = New-Object System.Windows.Forms.Label
    $labelKey.Location = New-Object System.Drawing.Point(20,172)
    $labelKey.Size = New-Object System.Drawing.Size(70,15)
    $labelKey.Text = 'Llave:'
    $TextBoxInputNamekey.Text="$($credenciales.nameKey)"
    $TextBoxInputNameKey.ReadOnly= $false
    $TextBoxInputNameKey.Width = 200
    $TextBoxInputNamekey.Height = 20
    $TextBoxInputNamekey.Location = New-Object Drawing.Point(100, 172)

    if($NameCred){
        $FunctionClickSave = "guardar -NameCred $NameCred"   
    }else{
        $FunctionClickSave = "guardar"
    }
    $ButtonSelector=createButton -text "Add Key" -Width 70 -Height 24 -X 99 -y 193 -FunctionClick "KeySelector"
    $ButtonSelector.Font = 13

    $ButtonEdit=createButton -text "Guardar" -Width 200 -Height 30 -X 100 -y 240 -FunctionClick $FunctionClickSave  #guardar 

    $Panel2.Controls.AddRange(@($labelDesc,$labelSv,$labelUser,$labelPort,$labelKey,$TextBoxInputDesc,$TextBoxInputSv,$TextBoxInputUser,$TextBoxInputPort,$TextBoxInputNamekey,$ButtonEdit,$ButtonSelector))
    $Form.controls.AddRange(@($Panel2))

}

function credencialesForm{  
    $credencialesDisponibles = $configuraciones.credenciales

    $ButtonAdd.Dispose()
    $Form.Controls.Remove($ResultText)
    $Panel2.controls.Clear()
    $Panel1.controls.Clear()
    $SubPanel1.controls.Clear()

    $posicionY = 5
    if($credencialesDisponibles){
        foreach ($credencial in $credencialesDisponibles.PSObject.Properties) {

            $credsName = $credencial.name
            $credsValue = $credencial.value
            
            
            $Buttondelete=createButton -text "-" -Width 15 -Height 30 -X 3 -y $posicionY -FunctionClick "eliminarCredencial -NameCred $credsName"
            $Button=createButton -text "$($credsValue.Descripcion)" -Width 180 -Height 30 -X 17 -y $posicionY -FunctionClick "credentialPanel -NameCred $credsName"  #select credenciales
            $posicionY += 35

            # Agregar el botón al panel1
            $SubPanel1.Controls.Add($Button)
            $SubPanel1.Controls.Add($Buttondelete)
        
            }
    }else{         
            $ButtonAdd=createButton -text "+ Add " -Width 60 -Height 30 -X 3 -y $posicionY -FunctionClick "credentialPanel"
            $SubPanel1.controls.Add($ButtonAdd)
    }

    $ButtonAdd=createButton -text "+ Add " -Width 60 -Height 30 -X 3 -y $posicionY -FunctionClick "credentialPanel"
    $SubPanel1.controls.Add($ButtonAdd)

    $ButtonCancel=createButton -text "Back" -Width 211 -Height 30 -X 3 -y 263 -FunctionClick "initForm"
    
    $ButtonExit=createButton -text "Exit" -Width 211 -Height 30 -X 3 -y 298 -FunctionClick "salir"
    
    $Label2.Text="Select:"
    $Label3.text="Data editor:"
    #$Label10.text= "Data editor:"
    $Panel1.Controls.AddRange(@($ButtonExit,$ButtonCancel,$Label2))   
    $Form.controls.AddRange(@($SubPanel1,$Panel1,$Panel2))
    credentialPanel
}

function KnockdForm{
    param (
        $NameCred
    )
    $KnockDisponibles = $configuraciones.knock
    $SubPanel1.Controls.Clear()
    $Panel1.controls.Clear()

    $ResultText.text = ""

   $posicionY = 5
   foreach ($property in $KnockDisponibles.PSObject.Properties) {
        $key = $property.Name
        $value = $property.Value
        $ResultText.text += "$key : $value`r`n"

        if(-not ($key -like "*sleep*")){
            $Button=createButton -text "$key" -Width 194 -Height 30 -X 3 -y $posicionY -FunctionClick "knockd -NameCred $NameCred -namePorts $key"
            $SubPanel1.controls.Add($Button)
            $posicionY += 35
        }
    }
  
    $ButtonCancel=createButton -text "Back" -Width 211 -Height 30 -X 3 -y 263 -FunctionClick "SecondForm -NameCred $NameCred"
    $ButtonExit=createButton -text "Exit" -Width 211 -Height 30 -X 3 -y 298 -FunctionClick "salir"

    $Label2.text="Sequences:"
    $Panel1.controls.AddRange(@($ButtonCancel,$ButtonExit,$Label2))

}
function MagicPacketForm{
    param (
        $NameCred
    )
    $MagicDisponibles = $configuraciones.magicPacket
    $SubPanel1.Controls.Clear()
    $Panel1.controls.Clear()

    $ResultText.text = ""

   $posicionY = 5
   foreach ($property in $MagicDisponibles.PSObject.Properties) {
        $key = $property.Name
        $value = $property.Value
        $ResultText.text += "$key : $value`r`n"

        
        $Button=createButton -text $value.Descripcion -Width 194 -Height 30 -X 3 -y $posicionY -FunctionClick "EncenderModulo -NameCred $NameCred -magicCred $key"
        $SubPanel1.controls.Add($Button)
        $posicionY += 35
        
    }
  
    $ButtonCancel=createButton -text "Back" -Width 211 -Height 30 -X 3 -y 263 -FunctionClick "SecondForm -NameCred $NameCred"
    $ButtonExit=createButton -text "Exit" -Width 211 -Height 30 -X 3 -y 298 -FunctionClick "salir"

    $Label2.text="Devices:"
    $Panel1.controls.AddRange(@($ButtonCancel,$ButtonExit,$Label2))

}
function createKeyForm{
    param($NameCred)

    $SubPanel1.Controls.Clear()
    $Panel1.controls.Clear()

    $ResultText.text = "Arguments: ssh-keygen [-q] [-b bits] [-C comment] [-f output_keyfile] [-m format]`r`n
                  [-N new_passphrase] [-t dsa | ecdsa | ed25519 | rsa]`r`n
       ssh-keygen -p [-f keyfile] [-m format] [-N new_passphrase]`r`n
                   [-P old_passphrase]`r`n
       ssh-keygen -i [-f input_keyfile] [-m key_format]`r`n
       ssh-keygen -e [-f input_keyfile] [-m key_format]`r`n
       ssh-keygen -y [-f input_keyfile]`r`n
       ssh-keygen -c [-C comment] [-f keyfile] [-P passphrase]`r`n
       ssh-keygen -l [-v] [-E fingerprint_hash] [-f input_keyfile]`r`n
       ssh-keygen -B [-f input_keyfile]`r`n
       ssh-keygen -D pkcs11`r`n
       ssh-keygen -F hostname [-lv] [-f known_hosts_file]`r`n
       ssh-keygen -H [-f known_hosts_file]`r`n
       ssh-keygen -R hostname [-f known_hosts_file]`r`n
       ssh-keygen -r hostname [-g] [-f input_keyfile]`r`n
       ssh-keygen -G output_file [-v] [-b bits] [-M memory] [-S start_point]`r`n
       ssh-keygen -f input_file -T output_file [-v] [-a rounds] [-J num_lines]`r`n
                  [-j start_line] [-K checkpt] [-W generator]`r`n
       ssh-keygen -I certificate_identity -s ca_key [-hU] [-D pkcs11_provider]`r`n
                  [-n principals] [-O option] [-V validity_interval]`r`n
                  [-z serial_number] file ...`r`n
       ssh-keygen -L [-f input_keyfile]`r`n
       ssh-keygen -A [-f prefix_path]`r`n
       ssh-keygen -k -f krl_file [-u] [-s ca_public] [-z version_number]`r`n
                  file ...`r`n
       ssh-keygen -Q -f krl_file file ...`r`n
       ssh-keygen -Y check-novalidate -n namespace -s signature_file`r`n
       ssh-keygen -Y sign -f key_file -n namespace file ...`r`n
       ssh-keygen -Y verify -f allowed_signers_file -I signer_identity`r`n
                -n namespace -s signature_file [-r revocation_file]`r`n"

    $posicionY=5
    $Label1 = New-Object System.Windows.Forms.Label
    $Label1.Location = New-Object System.Drawing.Point(5,$posicionY)
    $Label1.Size = New-Object System.Drawing.Size(70,15)
    $Label1.Text = 'Type of Key:'
    
    $comboBox.Location = New-Object Drawing.Point(80, $posicionY)
    $comboBox.Width = 100
    #inicializado al principio del codigo

    $posicionY += 35
    $labelName = New-Object System.Windows.Forms.Label
    $labelName.Location = New-Object System.Drawing.Point(3,$posicionY)
    $labelName.Size = New-Object System.Drawing.Size(150,15)
    $labelName.Text = 'Name Key (required)'
    $posicionY += 15  
    $TextBoxInputName.Text="" 
    $TextBoxInputName.Width = 194
    $TextBoxInputName.Height = 20
    $TextBoxInputName.Location = New-Object Drawing.Point(3, $posicionY)

    $posicionY += 35
    $labelPass = New-Object System.Windows.Forms.Label
    $labelPass.Location = New-Object System.Drawing.Point(3,$posicionY)
    $labelPass.Size = New-Object System.Drawing.Size(150,15)
    $labelPass.Text = 'Passphrase (optional)'
    $posicionY += 15  
    $TextBoxInputPass.Text="" 
    $TextBoxInputPass.Width = 194
    $TextBoxInputPass.Height = 20
    $TextBoxInputPass.Location = New-Object Drawing.Point(3, $posicionY)

    $posicionY += 35
    $labelbits = New-Object System.Windows.Forms.Label
    $labelbits.Location = New-Object System.Drawing.Point(3,$posicionY)
    $labelbits.Size = New-Object System.Drawing.Size(50,15)
    $labelbits.Text = 'Bits'
     $posicionY += 15
    $TextBoxInputbits.Text="4096" 
    $TextBoxInputbits.Width = 60
    $TextBoxInputbits.Height = 20
    $TextBoxInputbits.Location = New-Object Drawing.Point(3,$posicionY)

    $posicionY =$posicionY - 15
    $labelRounds = New-Object System.Windows.Forms.Label
    $labelRounds.Location = New-Object System.Drawing.Point(100,$posicionY)
    $labelRounds.Size = New-Object System.Drawing.Size(50,15)
    $labelRounds.Text = 'Rounds'
    $posicionY += 15  
    $TextBoxInputRounds.Text="100" 
    $TextBoxInputRounds.Width = 60
    $TextBoxInputRounds.Height = 20
    $TextBoxInputRounds.Location = New-Object Drawing.Point(100, $posicionY)

    $posicionY += 35
    $checkBoxSendKey.Text="AutoSend Key.pub to server"
    $checkBoxSendKey.Location = New-Object Drawing.Point(3, $posicionY)
    $checkBoxSendKey.Size = New-Object System.Drawing.Size(150,28)

    $posicionY += 35
    $labelDirectory = New-Object System.Windows.Forms.Label
    $labelDirectory.Location = New-Object System.Drawing.Point(3,$posicionY)
    $labelDirectory.Size = New-Object System.Drawing.Size(190,15) 
    $labelDirectory.Text = 'Directory to send Key (required)' 
    $posicionY += 15 
    $TextBoxInputDirectory.Text=".ssh/authorized_keys" 
    $TextBoxInputDirectory.Width = 194
    $TextBoxInputDirectory.Height = 20
    $TextBoxInputDirectory.Location = New-Object Drawing.Point(3, $posicionY)

    $posicionY += 35
    $labelArgument = New-Object System.Windows.Forms.Label
    $labelArgument.Location = New-Object System.Drawing.Point(3,$posicionY)
    $labelArgument.Size = New-Object System.Drawing.Size(160,15)
    $labelArgument.Text = 'Aditional Arguments (optional)'
    $posicionY += 15  
    $TextBoxInputArgumentKey.Text="" 
    $TextBoxInputArgumentKey.Width = 194
    $TextBoxInputArgumentKey.Height = 20
    $TextBoxInputArgumentKey.Location = New-Object Drawing.Point(3, $posicionY)

    $posicionY += 35
    $ButtonGenerate=createButton -text "Generate" -Width 194 -Height 30 -X 3 -y $posicionY -FunctionClick "creationKey -NameCred $NameCred"

    $ButtonCancel=createButton -text "Back" -Width 211 -Height 30 -X 3 -y 263 -FunctionClick "SecondForm -NameCred $NameCred"
    $ButtonExit=createButton -text "Exit" -Width 211 -Height 30 -X 3 -y 298 -FunctionClick "salir"

    $Label2.Text="Ssh-Keygen"
    $SubPanel1.controls.AddRange(@( $Label1,$comboBox,$ButtonGenerate,$labelArgument,$TextBoxInputArgumentKey,$labelName,$TextBoxInputName,$labelPass,$TextBoxInputPass,$labelbits, $TextBoxInputbits,$labelRounds,$TextBoxInputRounds,$labelDirectory,$TextBoxInputDirectory,$checkBoxSendKey))
    $Panel1.controls.AddRange(@($ButtonCancel,$ButtonExit,$Label2))
}
function sshForm{
    param ($NameCred)
    
    $SubPanel1.Controls.Clear()
    $Panel1.controls.Clear()

    $ResultText.text = "Parameters: [-46AaCfGgKkMNnqsTtVvXxYy] [-B bind_interface]`r`n
           [-b bind_address] [-c cipher_spec] [-D [bind_address:]port]`r`n
           [-E log_file] [-e escape_char] [-F configfile] [-I pkcs11]`r`n
           [-i identity_file] [-J [user@]host[:port]] [-L address]`r`n
           [-l login_name] [-m mac_spec]`r`n 
           [-O ctl_cmd] [-o option] [-p port]`r`n
           [-Q query_option] [-R address] [-S ctl_path] [-W host:port]`r`n
           [-w local_tun[:remote_tun]] destination [command]"

    $arguments="x"

    $posicionY = 5
    $checkBox11.Text = "Enable X11 forwarding"
    $checkBox11.Location = New-Object Drawing.Point(3, $posicionY)
    $checkBox11.Size = New-Object System.Drawing.Size(150,20)
    $checkBox11.add_CheckedChanged({})

    $posicionY += 30
    
    $checkBoxC.Text = "Enable Compression"
    $checkBoxC.Location = New-Object Drawing.Point(3, $posicionY)
    $checkBoxC.Size = New-Object System.Drawing.Size(150,20)

    #$posicionY += 30

    #$checkBoxRsa.Text ="Allow use RSA key"
    #$checkBoxRsa.Checked=$true
    #$checkBoxRsa.Location= New-Object Drawing.Point(3, $posicionY)
    #$checkBoxRsa.Size= New-Object System.Drawing.Size(150,20)

    $posicionY += 30
    $checkBoxK.Text = "Knock On"
    $checkBoxK.Location = New-Object Drawing.Point(3, $posicionY)
    $checkBoxK.Size = New-Object System.Drawing.Size(150,20)

    $posicionY += 30
    $labelArgument = New-Object System.Windows.Forms.Label
    $labelArgument.Location = New-Object System.Drawing.Point(3,$posicionY)
    $labelArgument.Size = New-Object System.Drawing.Size(160,15)
    $labelArgument.Text = 'Aditional Arguments (optional)'
    $posicionY += 15
    $TextBoxInputArgument.Text="" 
    $TextBoxInputArgument.Width = 194
    $TextBoxInputArgument.Height = 20
    $TextBoxInputArgument.Location = New-Object Drawing.Point(3, $posicionY)

    $posicionY += 30
    $ButtonSsh= createButton -text "Connect" -Width 194 -Height 30 -X 3 -y $posicionY -FunctionClick "IntentarConexionSSH -NameCred $NameCred"
    $ButtonEdit =createButton -text "Back" -Width 211 -Height 30 -X 3 -y 263 -FunctionClick "SecondForm -NameCred $NameCred"
    $ButtonExit=createButton -text "Exit" -Width 211 -Height 30 -X 3 -y 298 -FunctionClick {salir}

    $Label2.text ="Ssh protocol"
    $SubPanel1.controls.AddRange(@($checkBox11,$checkBoxC,$checkBoxK,$labelArgument,$TextBoxInputArgument,$ButtonSsh))
    $Panel1.controls.AddRange(@($ButtonEdit,$ButtonExit,$Label2))
    $Form.controls.AddRange(@($SubPanel1,$Panel1,$ResultText))
}

function SecondForm {
    param ($NameCred)

    $credencialesDisponibles = $configuraciones.credenciales
    
    $credenciales= $credencialesDisponibles.$NameCred

    $ResultText.text = "------Trabajando sobre '$($credenciales.Descripcion)'------ `r`n
        Servidor: '$($credenciales.Servidor)'`r`n
        Usuario: '$($credenciales.Usuario)'`r`n
        Puerto: '$($credenciales.Puerto)'`r`n
        NameKey: '$(($credenciales.nameKey -split '\\')[-1])'`r`n------------------------------------------------------------------------"

    #agrego las funciones a partir de acá, puedo crear boton por botón
    #$Form.Controls.Clear()
    $Panel1.Controls.Clear()
    $Panel2.controls.Clear()
    $SubPanel1.controls.Clear()

    $posicionY = 5
    $ButtonPower= createButton -text "Wake On Lan/Wan" -Width 194 -Height 30 -X 3 -y $posicionY -FunctionClick "MagicPacketForm -NameCred $NameCred"
    $posicionY += 35
    $ButtonSsh= createButton -text "SSH Service" -Width 194 -Height 30 -X 3 -y $posicionY -FunctionClick "sshForm -NameCred $NameCred"
    $posicionY += 35
    $ButtonSftp= createButton -text "SFTP Service" -Width 194 -Height 30 -X 3 -y $posicionY -FunctionClick "sftpmodule -NameCred $NameCred"
    $posicionY += 35
    $ButtonScp= createButton -text "SCP Transfer" -Width 194 -Height 30 -X 3 -y $posicionY -FunctionClick "EjecutarScp -NameCred $NameCred" 
    $posicionY += 35
    $ButtonKnock =createButton -text "Knockd Service" -Width 194 -Height 30 -X 3 -y $posicionY -FunctionClick "KnockdForm -NameCred $NameCred"
    $posicionY += 35
    $ButtonKeys =createButton -text "Create Ssh Keys" -Width 194 -Height 30 -X 3 -y $posicionY -FunctionClick "createKeyForm -NameCred $NameCred"
    $posicionY += 35
    $ButtonPing= createButton -text "Ping to $($credenciales.Servidor)" -Width 194 -Height 30 -X 3 -y $posicionY -FunctionClick "Ping -NameCred $NameCred"
    $posicionY += 35
    $ButtonSendCommand= createButton -text "Send Bash Command" -Width 194 -Height 30 -X 3 -y $posicionY -FunctionClick "SendCommandSSH -NameCred $NameCred"


    $ButtonEdit =createButton -text "Credentials" -Width 211 -Height 30 -X 3 -y 263 -FunctionClick {initForm}
    $ButtonExit=createButton -text "Exit" -Width 211 -Height 30 -X 3 -y 298 -FunctionClick {salir}

    #$Label1.text="Toolkit"
    $Label2.text = "Utilities:"
    $Panel1.controls.AddRange($Label2)
    $SubPanel1.controls.AddRange(@($ButtonSendCommand,$ButtonPower,$ButtonSsh,$ButtonPing,$ButtonScp,$ButtonKeys,$ButtonKnock,$ButtonSftp))
    $Panel1.controls.AddRange(@($ButtonEdit,$ButtonExit))
    $Form.controls.AddRange(@($SubPanel1,$Panel1,$ResultText))
}

function initForm{
    $credencialesDisponibles = $configuraciones.credenciales

    $Form.Controls.Remove($Panel2)
    #$Panel2.controls.Clear()
    $Panel1.controls.Clear()
    $SubPanel1.controls.Clear()
    $ResultText.text = "Seleccione credenciales.."

    $posicionY = 5
    if($credencialesDisponibles){
        foreach ($credencial in $credencialesDisponibles.PSObject.Properties) {
            $credsName = $credencial.name
            $creds = $credencial.value
            if($creds.Servidor.Trim().Length -eq 0){
                $scriptblock={}
            }else{
                $scriptblock= "SecondForm -NameCred $credsName"
        
            }

            $Button=createButton -text "$($creds.Descripcion)" -Width 193 -Height 30 -X 3 -y $posicionY -FunctionClick $scriptblock
            $posicionY += 35
            $SubPanel1.Controls.Add($Button)
         }
     }else{
       $Button=createButton -text "vacio" -Width 211 -Height 30 -X 3 -y $posicionY -FunctionClick ""
       $SubPanel1.Controls.Add($Button)
    }
  
    $ButtonEdit=createButton -text "Edit Credentials" -Width 211 -Height 30 -X 3 -y 263 -FunctionClick "credencialesForm"

    $ButtonExit=createButton -text "Exit" -Width 211 -Height 30 -X 3 -y 298 -FunctionClick {salir}

    $Panel1.Controls.AddRange(@($ButtonExit,$ButtonEdit))
    #$Label1.text                     = "Credentials"
    #$Label10.text                    = "Current Status:"
    $Label3.text="Current Status:"
    $Label2.text = "Slots:"
    $Panel1.controls.AddRange($Label2)
    $Form.controls.AddRange(@($SubPanel1,$Panel1,$ResultText,$Label3))
}

$configuraciones=cargarJson
$FILEKNOCK = $configuraciones.directorios.knockDir
$FILEPOWER = $configuraciones.directorios.powerDir
$FILECONNECTION = $configuraciones.directorios.conectionSshDir
$FILEPING = $configuraciones.directorios.pingDir

initForm 

$Form.ShowDialog()
