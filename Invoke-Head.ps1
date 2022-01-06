<#
.SYNOPSIS
  The "Invoke-Head" function is a wrapper for the 'Select-Object' cmdlet with the intent of being similar to the Unix 'head' command.

.EXAMPLE
  PS C:\> Get-Process | head

  Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName
  -------  ------    -----      -----     ------     --  -- -----------
      154       8     1652      28400       0.09   4584   0 agent_ovpnconnect_1594367036109
      270      16     4424      50260       0.53   4828   1 ApplicationFrameHost
       56       6     1144       4652       0.56   7896   1 AppUIMonitor
      124       8     1636      20864       0.16   4568   0 armsvc
      428      13    13420      34812      34.48    504   0 audiodg
      258      16    41172     216844       9.09   2104   1 brave
      334      18    48060      89260       3.44   3196   1 brave
      313      18     8352     214900     113.44   4196   1 brave
      258      16    22160     199584       1.92   5072   1 brave
      269      16    19988     211348      34.33   7456   1 brave


  PS C:\> Get-Process | head 5

  Handles  NPM(K)    PM(K)      WS(K)     CPU(s)     Id  SI ProcessName
  -------  ------    -----      -----     ------     --  -- -----------
      154       8     1652      28400       0.09   4584   0 agent_ovpnconnect_1594367036109
      270      16     4424      50260       0.53   4828   1 ApplicationFrameHost
       56       6     1144       4652       0.56   7896   1 AppUIMonitor
      124       8     1636      20864       0.16   4568   0 armsvc
      428      13    13420      34812      34.58    504   0 audiodg


    
  Here we run the "Invoke-Head" function using its built-in alias 'head'.  In the first example we run 'head' without any additional argument, and in return we see the first 10 objects by default.  In the second example we run 'head' and provide the argument of '5', which in return displays the first 5 object.

.NOTES
  Name:  Invoke-Head.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-06 | Initial Version
  Dependencies:  
  Notes:
  - Very good article which helped me to understand the usefulness of the begin{}, process{}, and end{} blocks especially in context of using my function with the Pipeline.  The information here helped me to solve the problem of gathering all objects from the Pipeline before enacting a "Select-Object" to the array:  https://www.sapien.com/blog/2019/05/13/advanced-powershell-functions-begin-to-process-to-end/

  - about_Pipelines:  https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipelines?view=powershell-5.1
  - about_Functions:  https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions?view=powershell-5.1

  .
#>
function Invoke-Head {
  [CmdletBinding()]
  [Alias('head')]
  param (
    [Parameter()]
    [int]
    $First = 10,
    [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
    [System.Object[]]
    $Object
  )
  
  begin {}
  
  process {
    $array += @($Object)
  }
  
  end {
    $array | Select-Object -First $First
  }
}