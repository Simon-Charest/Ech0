function Main()
{
    [object[]] $networks = Get-Networks
    [string] $filePath = "C:/temp/networks.txt"
    Print-Networks $networks
    Write-Networks $networks $filePath
}

function Get-Networks()
{
    # Get profiles
    [string[]] $profiles = netsh wlan show profiles

    # Get networks from profiles
    [string[]] $networks = $profiles |
        Select-String "All User Profile\s+:\s+(.*)" |
            ForEach {
                $_.Matches.Groups[1]
            }

    [string] $network
    [string[]] $informations
    [object[]] $data = @()

    # Get informations for each network
    ForEach ($network in $networks) {
        $informations = netsh wlan show profile name=$network key=clear

        # Get network key
        $informations |
            Select-String "Key Content\W+\:(.+)$" |
                ForEach {
                    $data += [PSCustomObject] @{
                        Network = $network;
                        Password = $_.Matches.Groups[1].Value.Trim()
                    }
                }
    }

    # Sort networks
    $data = $data | Sort-Object Network

    return $data
}

function Print-Networks([object[]] $networks)
{
    # Print network informations
    ForEach ($network in $networks) {
        Write-Host "$($network.Network) $($network.Password)"
    }
}

function Write-Networks([object[]] $networks, [string] $filePath)
{
    # Convert array to string
    [string] $string = $networks |
        ForEach {
            "$($_.Network) $($_.Password)`n"
        }
    
    # Write string to file
    $string | Out-File $filePath
}

Main
