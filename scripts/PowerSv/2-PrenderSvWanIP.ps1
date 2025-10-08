#----CONFIG-------
param (
 [int]$Parametro
)
$configuraciones = Get-Content -Raw -Path .\config.json | ConvertFrom-Json
$string ="credenciales$Parametro"
$credenciales = $configuraciones.$string

$RemoteDNSName = $credenciales.Servidor
$UDPPort = $configuraciones.magicPacket.Puerto
$MacAddress = $configuraciones.magicPacket.Mac
#-----------------
 
Set-StrictMode -Version Latest
 
function Send-Packet
{    param(
        [string] $MacAddress
    )
    try
    {

        $RemotePublicIPAddress = $RemoteDNSName
        $UDPPort = $UDPPort

        $TargetEndPoint = New-Object Net.IPEndPoint ([System.Net.IPAddress]::Parse($RemotePublicIPAddress), $UDPPort)

        $UdpClient = New-Object Net.Sockets.UdpClient
        ## Construct physical address instance for the MAC address of the machine (string to byte array)
        $MAC = [Net.NetworkInformation.PhysicalAddress]::Parse($MacAddress.ToUpper())
 
        ## Construct the Magic Packet frame
        $MagicPacket = [Byte[]](,0xFF*6) + ($MacAddress -split '-' | ForEach-Object { [Byte]('0x' + $_) }) * 16
 
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
Write "Sending magic packet to $MacAddress"
Send-Packet $MacAddress