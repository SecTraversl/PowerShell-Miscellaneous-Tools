<#
.SYNOPSIS
  The "Get-StopwatchTime" function is used in conjunction with and after the use of the "Start-Stopwatch" function.  Get-StopwatchTime checks the current time of the instantiated stopwatch object created by Start-Stopwatch.
  
.EXAMPLE
  PS C:\> Start-Stopwatch

  Global Variable of "$stopwatch" created...

  Use "Get-StopwatchTime" or "gswt" to see ellapsed $stopwatch time in a succinct format... or just type "$stopwatch"

  PS C:\> Get-StopwatchTime
  00:00:07
  PS C:\>
  PS C:\> gswt
  00:00:11



  Here we show the usage of two functions designed to be used together.  "Start-Stopwatch" creates a new 'stopwatch object' and the "Get-StopwatchTime" function or its built-in alias of 'gswt' will query the 'stopwatch object' and return how much time has elapsed.

.NOTES
  Name:  Get-StopwatchTime.ps1
  Author:  Travis Logue
  Version History:  1.2 | 2021-12-22 | Updated name and documentation
  Dependencies:  
  Notes:
  - The idea for this tool came from Adam Bertram:  https://mcpmag.com/articles/2017/10/19/using-a-stopwatch-in-powershell.aspx
  
  - This was helpful discussion on Global Variables, but needed to ensure that "-Name varName" is the syntax used (and not "-Name $varName" ):  https://stackoverflow.com/questions/12535419/setting-a-global-powershell-variable-from-a-function-where-the-global-variable-n

  .
#>
function Get-StopwatchTime {
  [CmdletBinding()]
  [alias("gswt")]
  param ( )
     
  process {
    $stopwatch.Elapsed.ToString() -replace "\..*",""
  }
  
}