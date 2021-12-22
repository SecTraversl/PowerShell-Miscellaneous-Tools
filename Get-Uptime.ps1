<#
.SYNOPSIS
  The "Get-Uptime" function calculates the uptime for the local system.

.EXAMPLE
  PS C:\> Get-Uptime

  Days              : 0
  Hours             : 10
  Minutes           : 39
  Seconds           : 11
  Milliseconds      : 949
  Ticks             : 383519494015
  TotalDays         : 0.443888303258102
  TotalHours        : 10.6533192781944
  TotalMinutes      : 639.199156691667
  TotalSeconds      : 38351.9494015
  TotalMilliseconds : 38351949.4015



  Here we run the function and in return get the uptime for the local system.

.NOTES
  Name:  Get-Uptime.ps1
  Author:  Travis Logue
  Version History:  1.2 | 2021-11-23 | Updated aesthetics
  Dependencies:  
  Notes:
  - 

  .
#>
function Get-Uptime {
  [CmdletBinding()]
  [Alias('uptime')]
  param ()
  
  begin {}
  
  process {    
    (Get-Date) - (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
  }
  
  end {}
}