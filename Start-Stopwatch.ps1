<#
.SYNOPSIS
  The "Start-Stopwatch" function sets a global $stopwatch variable with a value of a newly instantiated 'stopwatch object'.  To check the current time of the stopwatch object, you can use the "Get-StopwatchTime" or its built-in alias of 'gswt'

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
  Name:  Start-Stopwatch.ps1
  Author:  Travis Logue
  Version History:  1.2 | 2020-03-16 | Updated Version
  Dependencies:  
  Notes:
  - The idea for this tool came from Adam Bertram:  https://mcpmag.com/articles/2017/10/19/using-a-stopwatch-in-powershell.aspx
  
  - This was helpful discussion on Global Variables, but needed to ensure that "-Name varName" is the syntax used (and not "-Name $varName" ):  https://stackoverflow.com/questions/12535419/setting-a-global-powershell-variable-from-a-function-where-the-global-variable-n

  .
#>
function Start-Stopwatch {
  [CmdletBinding()]
  [Alias('stopwatch')]
  param (
    [switch]$Silent
  )
  
  begin {}
  
  process {

    Set-Variable -Name stopwatch -Value ([system.diagnostics.stopwatch]::StartNew()) -Scope Global

    if ($Silent) {
      continue
    }
    else {
      Write-Host "`n"'Global Variable of "$stopwatch" created...' -BackgroundColor Black -ForegroundColor Green
      Write-Host "`n"'Use "Get-StopwatchTime" or "gswt" to see ellapsed $stopwatch time in a succinct format... or just type "$stopwatch"'"`n"
    }

  }
  
  end {}
}



<#
function Get-Stopwatch {
  [CmdletBinding()]
  [alias("gsw")]
  param ( )
     
  process {
    $stopwatch.Elapsed.ToString() -replace "\..*",""
  }
  
  
}
#>





###################
# NOTES ... Creating a CLASS, that is a SUB-CLASS
###################

# Derived this from Fossen's "Classes_Examples.ps1"


<#
class StopwatchPlus : System.Diagnostics.Stopwatch {
  $TestProperty

  StopwatchPlus() { $This.TestProperty = 'The Default Value for TestProperty'}

  StopwatchPlus([string]$TestProperty) {
    $This.TestProperty = $TestProperty
  }

  [string] TestMethod() { Return $This.TestProperty + ' ' + "Method Time!"}

}
#>

<#
ß Temp> class StopwatchPlus : System.Diagnostics.Stopwatch {
  $TestProperty

  StopwatchPlus() { $This.TestProperty = 'The Default Value for TestProperty'}

  StopwatchPlus([string]$TestProperty) {
    $This.TestProperty = $TestProperty
  }

  [string] TestMethod() { Return $This.TestProperty + ' ' + "Method Time!"}

}

¢ Temp> $test = New-Object -TypeName Stopwatchplus


§ Temp> $test


TestProperty        : The Default Value for TestProperty
IsRunning           : False
Elapsed             : 00:00:00
ElapsedMilliseconds : 0
ElapsedTicks        : 0



¢ Temp> $test::StartNew()

IsRunning Elapsed          ElapsedMilliseconds ElapsedTicks
--------- -------          ------------------- ------------
     True 00:00:00.0100250                  10       100673


ß Temp> $test.TestMethod()
The Default Value for TestProperty Method Time!


ƒ Temp> $test.TestProperty
The Default Value for TestProperty

§ Temp> $worky = $test::StartNew()


☼ Temp> $worky

IsRunning Elapsed          ElapsedMilliseconds ElapsedTicks
--------- -------          ------------------- ------------
     True 00:00:04.4605455                4460     44605657


♣ Temp> $worky

IsRunning Elapsed          ElapsedMilliseconds ElapsedTicks
--------- -------          ------------------- ------------
     True 00:00:06.3401253                6340     63401442


♠ Temp> $test


TestProperty        : The Default Value for TestProperty
IsRunning           : False
Elapsed             : 00:00:00
ElapsedMilliseconds : 0
ElapsedTicks        : 0
#>





