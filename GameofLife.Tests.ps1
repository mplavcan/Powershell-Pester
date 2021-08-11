BeforeAll { 
  . $PSScriptRoot/GameOfLife.ps1
}

Describe 'Rules of Game of Life' {
    Describe 'Any live cell with fewer than two live neighbours dies, as if by underpopulation' {
        It '0 live neighbors' {
            Is-AliveNextCycle -IsAlive $true -LiveNeighborCount 0 |
                Should -Be $false
        }
        It '1 live neighbors' {
            Is-AliveNextCycle -IsAlive $true -LiveNeighborCount 1 |
                Should -Be $false
        }
    }

    Describe 'Any live cell with 2 or 3 live neighbors lives on' {
        It '2 live neighbors' {
            Is-AliveNextCycle -IsAlive $true -LiveNeighborCount 2 |
                Should -Be $true
        }

        It '3 live neighbors' {
            Is-AliveNextCycle -IsAlive $true -LiveNeighborCount 3 |
                Should -Be $true
        }
    }
    
    Describe 'Any live cell with more than three live neighbours dies, as if by overpopulation' {
        It '4 live neighbors' {
            Is-AliveNextCycle -IsAlive $true -LiveNeighborCount 4 |
                Should -Be $false
        }
    }
    
    Describe 'What happens to dead cells' {
        it 'Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction' {
            Is-AliveNextCycle -IsAlive $false -LiveNeighborCount 3 |
                Should -Be $true
        }

        it 'Any dead cell with two live neighbors stays dead' {
            Is-AliveNextCycle -IsAlive $false -LiveNeighborCount 2 |
                Should -Be $false
        }
    }


}