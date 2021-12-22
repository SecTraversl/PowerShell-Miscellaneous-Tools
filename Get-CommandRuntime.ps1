<#
.SYNOPSIS
  The "Get-CommandRuntime" function shows how long a previous command took to complete.  The default is to reference the previous command, however this can be changed by specifying a particular value for the "-PreviousCommandLookback" parameter ( e.g. if you want evaluate the duration of a command you ran that was 3 commands in the past, you would use the syntax "-PreviousCommandLookback 3" ).

.EXAMPLE
  PS C:\> $Computers = Get-ADComputer -Filter *
  PS C:\> gcr

  Days         : 0
  Hours        : 0
  Minutes      : 0
  Seconds      : 2
  Milliseconds : 148



  Here we first run a command to retrieve all AD Computer Objects.  Next we run the "Get-CommandRuntime" function using its built-in alias of 'gcr' and in return we see how long the previous command took to complete.

.NOTES
  Name:  Get-CommandRuntime.ps1
  Author:  Travis Logue
  Version History:  1.2 | 2021-12-22 | Refactored Version
  Dependencies:  
  Notes:
  - 

  .
#>
function Get-CommandRuntime {
  [CmdletBinding()]
  [Alias('gcr')]
  param (
    [Parameter(HelpMessage="Supply a number value.  The value indicates how far back in your command-line history you want to look for a given command to evaluate.  That start time and end time of that command will be evaluated and the duration of time it took for the command to complete will be returned.")]
    [int]
    $PreviousCommandLookback = "1"
  )
  
  begin {}
  
  process {
    $Results = (Get-History)[-$PreviousCommandLookback].EndExecutionTime - (Get-History)[-$PreviousCommandLookback].StartExecutionTime

    $Results | Select-Object Days,Hours,Minutes,Seconds,Milliseconds
  }
  
  end {}
}