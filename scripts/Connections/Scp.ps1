#----CONFIG-------
#$configuraciones = Get-Content -Raw -Path .\config.json | ConvertFrom-Json
#$credenciales = $configuraciones.credenciales
$servidor = $credenciales.Servidor
$usuario = $credenciales.Usuario
$puerto = $credenciales.Puerto
$nameKey = $credenciales.nameKey
$directorios = $configuraciones.directorios
$dire = $directorios.PrivateKeyDir
$pathToTransfer="${usuario}@${servidor}:~/"
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
#---------------------------------

# Crear un formulario
$form = New-Object Windows.Forms.Form
$form.Text = "Seleccionar y Copiar Archivo"
$form.Size = New-Object Drawing.Size(300, 400)
# Crear un cuadro de lista para mostrar archivos
$listBox = New-Object Windows.Forms.ListBox
$listBox.Location = New-Object Drawing.Point(10,30)
$listBox.Size = New-Object Drawing.Size(250,200)
# Crear un TextBox para mostrar la salida y mensajes
$textBox = New-Object Windows.Forms.TextBox
$textBox.Location = New-Object Drawing.Point(10, 280)
$textBox.Size = New-Object Drawing.Size(250, 70)
$textBox.Multiline = $true

# Obtener la lista de archivos en el directorio
$directorio = $directorios.FilesForTransfer
$archivos = Get-ChildItem $directorio | Where-Object { -not $_.PSIsContainer }

# Agregar archivos al cuadro de lista
foreach ($archivo in $archivos) {
    $listBox.Items.Add($archivo.Name)
}

# Crear un botón para copiar el archivo seleccionado
$button = New-Object Windows.Forms.Button
$button.Location = New-Object Drawing.Point(10,240)
$button.Size = New-Object Drawing.Size(80,30)
$button.Text = "Copiar"
$button.Add_Click({
    $archivoSeleccionado = $archivos[$listBox.SelectedIndex]
    if ($archivoSeleccionado) {
        $textBox.Clear()
        $textBox.AppendText("Copiando '$archivoSeleccionado'..Espere")
        scp "-P${puerto}" -i $dire/$nameKey "${directorio}/${archivoSeleccionado}" $pathToTransfer
        $textBox.Clear()
        if($LASTEXITCODE -gt 0){
             $textBox.AppendText("Error en la copia, Esp código de error $LASTEXITCODE`r`n")
        }else{
             $textBox.AppendText("Copia exitosa!`r`n")
        }
    } else {
        $textBox.AppendText("Por favor, selecciona un archivo antes de copiar.`r`n")
    }
})

#------------Agregar controles al formulario---------------------
$form.Controls.Add($listBox)
$form.Controls.Add($button)
$form.Controls.Add($textBox)

# Mostrar el formulario
$form.ShowDialog()
