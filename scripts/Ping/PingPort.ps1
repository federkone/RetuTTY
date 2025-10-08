#----CONFIG-------
$configuraciones = Get-Content -Raw -Path .\config.json | ConvertFrom-Json
$RemoteDNSName = $configuraciones.credenciales.Servidor
$portToTest = $configuraciones.magicPacket.Puerto
#-----------------
function Test-PortConnectivity {
    param (
        [string]$targetHost,
        [int]$port
    )

    try {
        $portResult = Test-NetConnection -ComputerName $targetHost -Port $port

        if ($portResult.TcpTestSucceeded) {
            Write-Host "Respuesta exitosa al puerto $port en $targetHost."
        } else {
            Write-Host "No se pudo escuchar al puerto $port en $targetHost."
        }
    } catch {
        Write-Host "Error al realizar la prueba de conectividad al puerto $port en $targetHost $_"
    }
}


Test-PortConnectivity -targetHost $RemoteDNSName -port $portToTest



