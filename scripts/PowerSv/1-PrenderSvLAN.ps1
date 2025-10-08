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
{
 
    param(
        [string] $MacAddress
    )
    try
    {

        $Broadcast = ([System.Net.IPAddress]::Broadcast)
 
        ## Create UDP client instance
        $UdpClient = New-Object Net.Sockets.UdpClient
 
        ## Create IP endpoints for each port
        $IPEndPoint = New-Object Net.IPEndPoint $Broadcast, $UDPPort

        ## Construct physical address instance for the MAC address of the machine (string to byte array)
        $MAC = [Net.NetworkInformation.PhysicalAddress]::Parse($MacAddress.ToUpper())
 
        ## Construct the Magic Packet frame
        $Packet =  [Byte[]](,0xFF*6)+($MAC.GetAddressBytes()*16)
 
        ## Broadcast UDP packets to the IP endpoint of the machine
        $UdpClient.Send($Packet, $Packet.Length, $IPEndPoint) | Out-Null
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