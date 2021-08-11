function Display-Cell () {
    Write-Host "#" -NoNewline -ForegroundColor white -BackgroundColor green
}

function Is-AliveNextCycle
{
    [CmdletBinding()]    Param(        [Parameter(Mandatory=$true)]        [bool] $IsAlive,        [Parameter(Mandatory=$true)]        [int] $LiveNeighborCount    )

    if ($IsAlive -eq $false -and $LiveNeighborCount -eq 2) {
        return $false
    }
    ($LiveNeighborCount -eq 2) -or ($LiveNeighborCount -eq 3)
    # DeMorgan's Laws
    #    a & b -> !(!a | !b)
}
