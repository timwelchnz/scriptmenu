Get-NetAdapter | Where-Object {$_.Status -eq "Up"} | ForEach-Object {
    $adapter = $_
    $ipConfig = Get-NetIPConfiguration -InterfaceIndex $adapter.InterfaceIndex
    
    $connectionType = if ($adapter.PhysicalMediaType -like "*802.11*" -or $adapter.Name -like "*Wi-Fi*") {
        "WiFi"
    } elseif ($adapter.PhysicalMediaType -like "*Ethernet*" -or $adapter.MediaType -eq "802.3") {
        "Ethernet"
    } else {
        "Other"
    }
    
    [PSCustomObject]@{
        Name = $adapter.Name
        Type = $connectionType
        Description = $adapter.InterfaceDescription
        Speed = $adapter.LinkSpeed
        IPAddress = ($ipConfig.IPv4Address.IPAddress -join ', ')
        Gateway = ($ipConfig.IPv4DefaultGateway.NextHop -join ', ')
        DNSServers = ($ipConfig.DNSServer.ServerAddresses -join ', ')
    }
}