<#
.SYNOPSIS
  The "Get-ConsoleColors" function displays the console color names in the color they represent on the console.

.EXAMPLE
  PS C:\> Colors
  Black
  DarkBlue
  DarkGreen
  DarkCyan
  DarkRed
  DarkMagenta
  DarkYellow
  Gray
  DarkGray
  Blue
  Green
  Cyan
  Red
  Magenta
  Yellow
  White



  Here we run the "Get-ConsoleColors" function using its built-in alias of 'Colors'.  When this function is run in the terminal each Color Name is depicted in the color it describes.

.NOTES
  Name:  Get-ConsoleColors.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2022-01-10 | Initial Version
  Dependencies:  
  Notes:
  - The code for this was retrieved from here:  https://stackoverflow.com/questions/20541456/list-of-all-colors-available-for-powershell

  .
#>
function Get-ConsoleColors {
  [CmdletBinding()]
  [Alias('Colors','ConsoleColors')]
  param ()
  
  begin {}
  
  process {
    [Enum]::GetValues([System.ConsoleColor]) | % { Write-Host "$_" -ForegroundColor $_}
  }
  
  end {}
}