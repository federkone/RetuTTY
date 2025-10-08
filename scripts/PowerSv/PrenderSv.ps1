#----CONFIG-------
param (
 $Parametro,$magicCred
)
$configuraciones = Get-Content -Raw -Path .\config.json | ConvertFrom-Json
$string =$Parametro
$credenciales = $configuraciones.credenciales.$Parametro
$RemoteDNSName = $credenciales.Servidor

#---------------------------------------
$UDPPort = $configuraciones.magicPacket.$magicCred.Puerto
$MacAddress = $configuraciones.magicPacket.$magicCred.Mac
#-----------------


Set-StrictMode -Version Latest


function Send-Packet
{
 
    param(
        [string]$RemoteDNSName,
        [int]$UDPPort,
        [string]$MacAddress
    )
    try
    {
        $RemoteIPAddress = [System.Net.Dns]::GetHostAddresses($RemoteDNSName)[0] 
        
       if ($RemoteIPAddress.AddressFamily -eq 'InterNetwork' -and $RemoteIPAddress.IPAddressToString -match '^192\.168\.|^10\.|^172\.(1[6-9]|2[0-9]|3[0-1])\.') { #asumo que las ipv4 son de este rango,este fragmento de codigo puede estar sujeto a cambios
            $Broadcast = ([System.Net.IPAddress]::Broadcast)        
            $TargetEndPoint = New-Object Net.IPEndPoint $Broadcast, $UDPPort
        
        }else {$TargetEndPoint = New-Object Net.IPEndPoint $RemoteIPAddress, $UDPPort}
      
        #-------------------------------
        $UdpClient = New-Object Net.Sockets.UdpClient
        ## Construct physical address instance for the MAC address of the machine (string to byte array)
        
 
        ## Construct the Magic Packet frame
        $MagicPacket = [Byte[]](,0xFF*6) + ($MacAddress -split '-' | ForEach-Object { [Byte]('0x' + $_) }) * 16  #cambiar -split "-" por ":"
 
        ## Broadcast UDP packets to the IP endpoint of the machine
        $UdpClient.Send($MagicPacket, $MagicPacket.Length, $TargetEndPoint)
        $UdpClient.Close()
    }
    catch
    {
        $UdpClient.Dispose()
        $Error | Write-Error;
    }
}

## Send magic packet to wake machine

Send-Packet -RemoteDNSName $RemoteDNSName -UDPPort $UDPPort -MacAddress $MacAddress

