<# 
  Sample Pester tests

#>

BeforeAll { 
  . $PSScriptRoot/GameOfLife.ps1
}

Describe 'Rules of Game of Life' {
    It 'Any live cell with fewer than two live neighbours dies, as if by underpopulation' {
        $result = Is-AliveNextCycle -IsAlive $true -LiveNeighborCount 0
        $result | Should -Be $false
    }

}
