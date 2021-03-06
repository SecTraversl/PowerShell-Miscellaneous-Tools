<#
.SYNOPSIS
  The "Change-Prompt" function modifies the current shell prompt so that only the last significant directory is displayed.

.EXAMPLE
  PS C:\> Change-Prompt
  ♣ C:\> 


  Here we run the function and change the prompt.

.NOTES
  Name:  Change-Prompt.ps1
  Author:  Travis Logue
  Version History:  1.3 | 2021-12-21 | Refactored the tool
  Dependencies:  
  Notes:
  - The characters below are properly displayed when using what certain cmdlets refer to as "Unicode" or which the 'Save as...' Encoding functionality for notepad.exe refers to as "UTF-16 LE" (UTF-16 Little Endian)

  - In order to write the content appropriately to a file using the proper encoding I did the following:
      $content = @'
      function prompt {
        $host.ui.RawUI.ForegroundColor = "white"
        $PathLocation = Split-Path -Leaf -Path (Get-Location)
        $CharacterObj = (Get-Random -InputObject ♥, ♦, ♣, ♠, ☼, §, ƒ, √, ß, ¿, Ω, ¢, ≈)
        Write-Output "$CharacterObj $PathLocation> "
      }
      '@

      Set-Content -Path "~\Documents\Temp\ps1_files\Other-Misc-Tools\Change-Prompt.ps1" -Value $Content -Encoding Unicode

  - This forum post is quite helpful:  https://stackoverflow.com/questions/40098771/changing-powershells-default-output-encoding-to-utf-8
  - This lists various cmdlets that have the "-Encoding" parameter:  https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_character_encoding?view=powershell-5.1
  - This lists the various validate-set parameters for the "-Encoding" parameter and what they indicate (e.g. "Unicode" == UTF-16 LE):  https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.management/set-content?view=powershell-5.1

  
  .
#>
function prompt {
  $host.ui.RawUI.ForegroundColor = "white"
  $PathLocation = Split-Path -Leaf -Path (Get-Location)
  $CharacterObj = (Get-Random -InputObject ♥, ♦, ♣, ♠, ☼, §, ƒ, √, ß, ¿, Ω, ¢, ≈)
  Write-Output "$CharacterObj $PathLocation> "
}