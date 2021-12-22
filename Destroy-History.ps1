<#
.SYNOPSIS
  The "Destroy-History" function implements multiple techniques to completely clear out command-line history.

.EXAMPLE
  PS C:\> Destroy-History


  Removes current session command-line history as well as PSReadline/PSConsoleReadLine history.
  
.NOTES
  Name:  Destroy-History.ps1
  Author:  Travis Logue
  Version History:  1.2 | 2021-12-22 | Updated documentation
  Dependencies:  
  Notes:
  - This was helpful:  https://stackoverflow.com/questions/13257775/powershells-clear-history-doesnt-clear-history

  .
#>
function Destroy-History {
  [CmdletBinding()]
  param ()
  
  begin {}
  
  process {
    Clear-History
    [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()
    rm (Get-PSReadLineOption).HistorySavePath
  }
  
  end {}
}