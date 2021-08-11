<# 
  Sample Pester tests

#>

BeforeAll { 
  . $PSScriptRoot/GameOfLife.ps1
}

Describe 'Get-Planet' {
    It 'Given no parameters, it lists all 8 planets' {
        $allPlanets = Get-Planet
        $allPlanets.Count | Should -Be 8
    }
}
