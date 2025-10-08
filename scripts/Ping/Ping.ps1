#----CONFIG-------
param (
 $Parametro
)
$configuraciones = Get-Content -Raw -Path .\config.json | ConvertFrom-Json
$string =$Parametro
$credenciales = $configuraciones.credenciales.$string

$servidor = $credenciales.Servidor
#-----------------
function Ping-MyHost {
    param (
        [string]$targetHost
    )

    try {
        $result = Test-Connection -ComputerName $targetHost -Count 1 -ErrorAction Stop

        Write-Host "El host $targetHost respondió al ping."
    } catch {
        Write-Host "El host $targetHost no respondió al ping. Error: $_"
    }
}

Ping-MyHost -targetHost $servidor
Read-Host "Pulsa una tecla para salir..."
Exit
