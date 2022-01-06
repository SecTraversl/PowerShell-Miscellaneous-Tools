<#
.SYNOPSIS
  The "Invoke-Tail" function is a wrapper for the 'Select-Object' cmdlet with the intent of being similar to the Unix 'tail' command.

.EXAMPLE
  PS C:\> Get-Process | tail

  Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName
  -------  ------    -----      -----     ------     --  -- -----------
      375      24    17736      84320      25.56   6580   0 WmiPrvSE
      170      10     2800      16272       1.41   6592   0 WmiPrvSE
      448      27    88460     136552       6.23   6596   0 WmiPrvSE
      177      11     4096      22924       3.06   7572   0 WmiPrvSE
      380      15    11420      32460      60.14  16132   0 WmiPrvSE
      758      17     3892      22780     109.06   2228   0 WUDFHost
      295      12     2328      17256      17.16   3368   0 WUDFHost
      323      11     2176      17620       2.70   5148   0 WUDFHost
      182      13     2468      41772       0.19   9472   1 bagtnotif
      638      42    29000     199696       1.44   8800   1 YourPhone


  PS C:\> Get-Process | tail 5

  Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName
  -------  ------    -----      -----     ------     --  -- -----------
      758      17     3892      22780     109.08   2228   0 WUDFHost
      295      12     2328      17256      17.16   3368   0 WUDFHost
      323      11     2176      17620       2.70   5148   0 WUDFHost
      182      13     2464      41776       0.19   9472   1 bagtnotif
      638      42    29000     199696       1.44   8800   1 YourPhone


    
  Here we run the "Invoke-Tail" function using its built-in alias 'tail'.  In the first example we run 'tail' without any additional argument, and in return we see the last 10 objects by default.  In the second example we run 'tail' and provide the argument of '5', which in return displays the last 5 object.

.NOTES
  Name:  Invoke-Tail.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-06 | Initial Version
  Dependencies:  
  Notes:
  - Very good article which helped me to understand the usefulness of the begin{}, process{}, and end{} blocks especially in context of using my function with the Pipeline.  The information here helped me to solve the problem of gathering all objects from the Pipeline before enacting a "Select-Object" to the array:  https://www.sapien.com/blog/2019/05/13/advanced-powershell-functions-begin-to-process-to-end/

  - about_Pipelines:  https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipelines?view=powershell-5.1
  - about_Functions:  https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions?view=powershell-5.1

  .
#>
function Invoke-Tail {
  [CmdletBinding()]
  [Alias('tail')]
  param (
    [Parameter()]
    [int]
    $Last = 10,
    [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
    [System.Object[]]
    $Object
  )
  
  begin {}
  
  process {
    $array += @($Object)
  }
  
  end {
    $array | Select-Object -Last $Last
  }
}