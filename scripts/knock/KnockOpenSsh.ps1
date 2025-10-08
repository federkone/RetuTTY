#------CONFIG------
#------------credenciales--------------
param (
 [int]$Parametro
)

$configuraciones = Get-Content -Raw -Path .\config.json | ConvertFrom-Json
$string ="credenciales$Parametro"
$credenciales = $configuraciones.$string
#---------------
$remoteHost = $credenciales.Servidor
$portsToKnock = $configuraciones.knock.PuertosOn
$sleep = $configuraciones.knock.sleep
#-----------------

function Send-Knock {
    Param(
        [String] $remoteHost = "localhost",
        [ValidateRange(1,65535)][int[]]$ports,
        [int]$sleepInMs = 10
    )

    foreach($port in $ports)
    {
        $requestCallback = $state = $null
        $client = New-Object System.Net.Sockets.TcpClient
        $beginConnect = $client.BeginConnect($remoteHost, $port, $requestCallback, $state)
        $beginConnect.IsCompleted | Out-Null
        Start-Sleep -Milliseconds $sleepInMs
        $client.Close()
    }
}


# Llamar a la función Send-Knock con los parámetros especificados
Send-Knock -remoteHost $remoteHost -ports $portsToKnock -sleepInMs $sleep
