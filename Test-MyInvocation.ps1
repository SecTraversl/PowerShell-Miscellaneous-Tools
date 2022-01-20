<#
.SYNOPSIS
  The "Test-MyInvocation" function demonstrates different ways to leverage the $MyInvocation Automatic Variable so that code execution can be controlled based off of 1.) Dot-Sourcing the .ps1 file so that you can load the embedded function into memory, while not executing any other code 2.) Running the file as a script  3.) Running the file by right-clicking it in File Explorer and selecting the 'Run with PowerShell' option.

.EXAMPLE
  PS C:\> . .\Test-MyInvocation.ps1
  PS C:\> .\Test-MyInvocation.ps1

  We are in the bottom block which checks the $MyInvocation.InvocationName and $MyInvocation.MyCommand

  This block will run when:
          1.) The user is running the file as a script, e.g. '.\Test-MyInvocation.ps1'


  Below is the Output from the '$MyInvocation | Format-List' command



  MyCommand             : Test-MyInvocation.ps1
  BoundParameters       : {}
  UnboundArguments      : {}
  ScriptLineNumber      : 1
  OffsetInLine          : 1
  HistoryId             : 103
  ScriptName            :
  Line                  : .\Test-MyInvocation.ps1
  PositionMessage       : At line:1 char:1
                          + .\Test-MyInvocation.ps1
                          + ~~~~~~~~~~~~~~~~~~~~~~~
  PSScriptRoot          :
  PSCommandPath         :
  InvocationName        : .\Test-MyInvocation.ps1
  PipelineLength        : 1
  PipelinePosition      : 1
  ExpectingInput        : False
  CommandOrigin         : Runspace
  DisplayScriptPosition :



  Now running...:  Test-MyInvocation (the function)


  We are in the top 'else' block which will run when the 'if' block that checks for dot-sourcing is NOT matched


  Now we are in the nested 'else' block that runs by default when the function is called.

  This block will run when:
          1.) The '-CurrentDirectoryOfTheTool' parameter is NOT used
          2.) The .ps1 file itself is NOT being invoked by right-clicking the file in File Explorer and selecting 'Run with PowerShell'


  Below is the Output from the '$MyInvocation | Format-List' command



  MyCommand             : Test-MyInvocation
  BoundParameters       : {}
  UnboundArguments      : {}
  ScriptLineNumber      : 251
  OffsetInLine          : 3
  HistoryId             : 103
  ScriptName            : C:\Users\Jannus.Fugal\Documents\Temp\temp\Test-MyInvocation.ps1
  Line                  :   Test-MyInvocation

  PositionMessage       : At C:\Users\Jannus.Fugal\Documents\Temp\temp\Test-MyInvocation.ps1:251 char:3
                          +   Test-MyInvocation
                          +   ~~~~~~~~~~~~~~~~~
  PSScriptRoot          : C:\Users\Jannus.Fugal\Documents\Temp\temp
  PSCommandPath         : C:\Users\Jannus.Fugal\Documents\Temp\temp\Test-MyInvocation.ps1
  InvocationName        : Test-MyInvocation
  PipelineLength        : 1
  PipelinePosition      : 1
  ExpectingInput        : False
  CommandOrigin         : Internal
  DisplayScriptPosition :



  Here we demonstrate what occurs when we 
    1.) Dot Source the '. .\Test-MyInvocation.ps1' file  
    2.) "Run" the '.\Test-MyInvocation.ps1' file in the PowerShell terminal like we would a script

.EXAMPLE
  PS C:\>
  PS C:\> Test-MyInvocation
  Now running...:  Test-MyInvocation (the function)


  We are in the top 'else' block which will run when the 'if' block that checks for dot-sourcing is NOT matched


  Now we are in the nested 'else' block that runs by default when the function is called.

  This block will run when:
          1.) The '-CurrentDirectoryOfTheTool' parameter is NOT used
          2.) The .ps1 file itself is NOT being invoked by right-clicking the file in File Explorer and selecting 'Run with PowerShell'


  Below is the Output from the '$MyInvocation | Format-List' command



  MyCommand             : Test-MyInvocation
  BoundParameters       : {}
  UnboundArguments      : {}
  ScriptLineNumber      : 1
  OffsetInLine          : 1
  HistoryId             : 107
  ScriptName            :
  Line                  : Test-MyInvocation
  PositionMessage       : At line:1 char:1
                          + Test-MyInvocation
                          + ~~~~~~~~~~~~~~~~~
  PSScriptRoot          :
  PSCommandPath         :
  InvocationName        : Test-MyInvocation
  PipelineLength        : 1
  PipelinePosition      : 1
  ExpectingInput        : False
  CommandOrigin         : Runspace
  DisplayScriptPosition :



  Here we demonstrate what occurs when we 1.) "Call" the function named 'Test-MyInvocation' that is now in memory / loaded into our PowerShell terminal (we loaded the defined function when we Dot-Sourced the '.\Test-MyInvocation.ps1' file).

.EXAMPLE
  PS C:\> ls


      Directory: C:\Users\Jannus.Fugal\Documents\Temp\temp


  Mode                 LastWriteTime         Length Name
  ----                 -------------         ------ ----
  -a----         1/14/2022  12:47 PM           4117 Test-MyInvocation.ps1


  PS C:\>
  PS C:\> # In File Explorer we right-clicked the "Test-MyInvocation.ps1" file and selected 'Run with PowerShell', which creates a new file named 'Output-File_When-We-Used_Run-with-PowerShell.txt' in the current directory #
  PS C:\>
  PS C:\> ls


      Directory: C:\Users\Jannus.Fugal\Documents\Temp\temp


  Mode                 LastWriteTime         Length Name
  ----                 -------------         ------ ----
  -a----         1/14/2022  12:56 PM            317 Output-File_When-We-Used_Run-with-PowerShell.txt
  -a----         1/14/2022  12:47 PM           4117 Test-MyInvocation.ps1


  ####################################################################################
  ######### A NEW POWERSHELL TERMINAL APPEARS AND SHOWS THE FOLLOWING OUTPUT #########
  ####################################################################################

  We are in the bottom block which checks if this file is being invoked by right-clicking the file in File Explorer and
  selecting 'Run with PowerShell'


  Below is the Output from the '$MyInvocation | Format-List' command



  MyCommand             : Test-MyInvocation.ps1
  BoundParameters       : {}
  UnboundArguments      : {}
  ScriptLineNumber      : 1
  OffsetInLine          : 91
  HistoryId             : 1
  ScriptName            :
  Line                  : if((Get-ExecutionPolicy ) -ne 'AllSigned') { Set-ExecutionPolicy -Scope Process Bypass }; &
                          'C:\Users\Jannus.Fugal\Documents\Temp\temp\Test-MyInvocation.ps1'
  PositionMessage       : At line:1 char:91
                          + ... s Bypass }; & 'C:\Users\Jannus.Fugal\Documents\Temp\temp\Test-MyInvoc ...
                          +                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  PSScriptRoot          :
  PSCommandPath         :
  InvocationName        : &
  PipelineLength        : 1
  PipelinePosition      : 1
  ExpectingInput        : False
  CommandOrigin         : Runspace
  DisplayScriptPosition :




  We are adding the following content to a file here:
  FileName:       C:\Users\Jannus.Fugal\Documents\Temp\temp\Output-File_When-We-Used_Run-with-PowerShell.txt

  FileContent:    We just right-clicked the tool and selected 'Run with PowerShell'
  The directory of the tool we 'Ran with PowerShell' is: C:\Users\Jannus.Fugal\Documents\Temp\temp
  Even if a $profile script changes the current working directory, we will save the file...
  ... in the directory of the tool that we 'Ran with PowerShell'

  Now running...:  'Test-MyInvocation -CurrentDirectoryOfTheTool C:\Users\Jannus.Fugal\Documents\Temp\temp'

  Now running...:  Test-MyInvocation (the function)


  We are in the top 'else' block which will run when the 'if' block that checks for dot-sourcing is NOT matched


  Now we are in the nested 'if' block that runs when the '-CurrentDirectoryOfTheTool' parameter is used.  This block wi
  ll run automatically if the function is being run with no additional or parameters

  This block WILL NOT BE RUN when the .ps1 file is being invoked by right-clicking the file in File Explorer and select
  ing 'Run with PowerShell'


  Below is the Output from the '$MyInvocation | Format-List' command



  MyCommand             : Test-MyInvocation
  BoundParameters       : {[CurrentDirectoryOfTheTool, C:\Users\Jannus.Fugal\Documents\Temp\temp]}
  UnboundArguments      : {}
  ScriptLineNumber      : 289
  OffsetInLine          : 3
  HistoryId             : 1
  ScriptName            : C:\Users\Jannus.Fugal\Documents\Temp\temp\Test-MyInvocation.ps1
  Line                  :   Test-MyInvocation -CurrentDirectoryOfTheTool $CurrentDirectoryOfTheTool

  PositionMessage       : At C:\Users\Jannus.Fugal\Documents\Temp\temp\Test-MyInvocation.ps1:289 char:3
                          +   Test-MyInvocation -CurrentDirectoryOfTheTool $CurrentDirectoryOfThe ...
                          +   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  PSScriptRoot          : C:\Users\Jannus.Fugal\Documents\Temp\temp
  PSCommandPath         : C:\Users\Jannus.Fugal\Documents\Temp\temp\Test-MyInvocation.ps1
  InvocationName        : Test-MyInvocation
  PipelineLength        : 1
  PipelinePosition      : 1
  ExpectingInput        : False
  CommandOrigin         : Internal
  DisplayScriptPosition :





  Here we demonstrate what occurs when we right-click on the "Test-MyInvocation.ps1" file when using File Explorer and select the 'Run with PowerShell' option.  In this case, the code explicitly looks for the invocation operation specific to the 'Run with PowerShell operation ( there is a specific value associated with the $MyInvocation.Line property that helps us to identify when this occurs) and outputs a file with certain content.

.NOTES
  Name:  Test-MyInvocation.ps1
  Author:  Travis Logue
  Version History:  1.3 | 2022-01-19 | Updated the documentation and refactored the code
  Dependencies:  
  Notes:
  - Got the recommendation on how to mimic the if main == name boiler plate in python using $MyInvocation from here:  https://stackoverflow.com/questions/4693947/powershell-equivalent-of-pythons-if-name-main

  - Good demo on $MyInvocation testing:  https://petri.com/unraveling-mystery-myinvocation

  - I did not use this, but am keeping it here for reference:  https://stackoverflow.com/questions/21000989/how-can-i-create-a-powershell-main-function

  .
#>
function Test-MyInvocation {
  [CmdletBinding()]
  param (
    [Parameter()]
    [string]
    $CurrentDirectoryOfTheTool = $null
  )
  
  begin {}
  
  process {

    Write-Host "Now running...:  $($MyInvocation.MyCommand) (the function)`n" -BackgroundColor Black -ForegroundColor Yellow


    if ($MyInvocation -match '^(\s+)?\.\s+') {
      # If we are in this block then this tool is being dot-sourced, so we do not execute any meaningful code here, instead we place the meaningful code in the 'else' block so that when the function is called the meaningful code will run

      Write-Host "`nThis will match on '. .\Invoke-ThisAwesomeCapability.ps1' `n"
      Write-Host "`nAlso it will match ' .  C:\Invoke-ThisAwesomeCapability.ps1' `n"

      Write-Host "`nBelow is the Output from the '`$MyInvocation | Format-List' command`n" -BackgroundColor Black -ForegroundColor Yellow
      $MyInvocation | Format-List

      # INTERESTINGLY ENOUGH... this Out-File line, nore the Write-Host lines, etc. are ever run, even if this block seems to be matched... 
      ### "Looks like this was Dot Sourced" | Out-File "Test_MyInvocation_was_DotSourced_$(Get-Date -Format 'yyyy-MM-dd_HHmm').txt"

    }
    else {
      # This block is run when we call the function like we would a cmdlet that is already loaded in the powershell terminal

      Write-Host "`nWe are in the top 'else' block which will run when the 'if' block that checks for dot-sourcing is NOT matched`n" -BackgroundColor Black -ForegroundColor Yellow

    
      # We added this next code block for cases where a $profile script is in use and arbitrarily changes the the "Set-Location" of the PowerShell terminal
      # - In such cases, we can use the "-CurrentDirectoryOfTheTool" parameter (which is tracked in the code block at the very bottom - where the invocation matches that of using the 'Run with PowerShell' File Explorer option) in order to "anchor" the directory where this file is located so that we can use this tool/file as a template control script used with other files/scripts/tools/binaries also in the same "anchored" directory.  This allows us to .zip everything up and have one package where everything is contained
      if ($CurrentDirectoryOfTheTool) {

        Write-Host "`nNow we are in the nested 'if' block that runs when the '-CurrentDirectoryOfTheTool' parameter is used.  This block will run automatically if the function is being run with no additional or parameters`n" -BackgroundColor Black -ForegroundColor Yellow
        Write-Host "This block WILL NOT BE RUN when the .ps1 file is being invoked by right-clicking the file in File Explorer and selecting 'Run with PowerShell'`n"
        
        Write-Host "`nBelow is the Output from the '`$MyInvocation | Format-List' command`n" -BackgroundColor Black -ForegroundColor Yellow
        $MyInvocation | Format-List

      }
      else {

        Write-Host "`nNow we are in the nested 'else' block that runs by default when the function is called.`n" -BackgroundColor Black -ForegroundColor Yellow
        Write-Host "This block will run when:`n`t1.) The '-CurrentDirectoryOfTheTool' parameter is NOT used`n`t2.) The .ps1 file itself is NOT being invoked by right-clicking the file in File Explorer and selecting 'Run with PowerShell'`n"

        Write-Host "`nBelow is the Output from the '`$MyInvocation | Format-List' command`n" -BackgroundColor Black -ForegroundColor Yellow
        $MyInvocation | Format-List

      }

    }

  }
  
  end {}
}

if ("$($MyInvocation.InvocationName)" -match [regex]::Escape("$($MyInvocation.MyCommand)")) {
  # This 'if' block will run when the end user is running this as a script, e.g.  ".\Test-MyInvocation.ps1"

  # - If you are using the bulk of this function in a production tool, remove these next three lines
  Write-Host "`nWe are in the bottom block which checks the `$MyInvocation.InvocationName and `$MyInvocation.MyCommand`n" -BackgroundColor Black -ForegroundColor Yellow
  Write-Host "This block will run when:`n`t1.) The user is running the file as a script, e.g. '.\Test-MyInvocation.ps1'`n"

  Write-Host "`nBelow is the Output from the '`$MyInvocation | Format-List' command`n" -BackgroundColor Black -ForegroundColor Yellow
  $MyInvocation | Format-List


  # - Here we call the function that was defined above, so that if the user does run this file as a script, the function will be invoked as intended
  Test-MyInvocation


}
elseif ("$($MyInvocation.Line)" -match ([regex]::Escape("if((Get-ExecutionPolicy ) -ne 'AllSigned') { Set-ExecutionPolicy -Scope Process Bypass }; &") + '.*' + [regex]::Escape("$($MyInvocation.MyCommand)") )  ) {
  # This 'elseif' block will run if the "Test-MyInvocation" file is right-clicked in File Explorer and 'Run with PowerShell' is selected

  # - Here we parse the 'Line' property of $MyInvocation in order to save the 'Parent Directory' path where the "Test-MyInvocation.ps1" file is currently located 
  $CurrentDirectoryOfTheTool = "$($MyInvocation.Line)".Split(';')[-1].TrimStart(" & '").TrimEnd("'") | Split-Path


  # - If you are using the bulk of this function in a production tool, remove this next section
  Write-Host "`nWe are in the bottom block which checks if this file is being invoked by right-clicking the file in File Explorer and selecting 'Run with PowerShell'`n" -BackgroundColor Black -ForegroundColor Yellow

  Write-Host "`nBelow is the Output from the '`$MyInvocation | Format-List' command`n" -BackgroundColor Black -ForegroundColor Yellow
  $MyInvocation | Format-List

  $Content = "We just right-clicked the tool and selected 'Run with PowerShell'`n"
  $Content += "The directory of the tool we 'Ran with PowerShell' is: $CurrentDirectoryOfTheTool`n"
  $Content += "Even if a `$profile script changes the current working directory, we will save the file...`n"
  $Content += "... in the directory of the tool that we 'Ran with PowerShell'"

  Write-Host "`nWe are adding the following content to a file here:" -BackgroundColor Black -ForegroundColor Yellow
  Write-Host "FileName:`t$CurrentDirectoryOfTheTool\Output-File_When-We-Used_Run-with-PowerShell.txt`n"
  Write-Host "FileContent:`t$Content`n"
  
  Set-Content -Value $Content -Path "$CurrentDirectoryOfTheTool\Output-File_When-We-Used_Run-with-PowerShell.txt"
  
  Start-Sleep -Seconds 10


  # - If you are using the bulk of this function in a production tool, replace "Test-MyInvocation" with the function that you have defined above
  #    In order to track the full path of the directory the "Test-MyInvocation.ps1" file resides in we created the "$CurrentDirectoryOfTheTool" variable above
  #   - When using "Run with PowerShell" option the $profile script (if it exists) is loaded, and the current working directory may change... which could break things if the "Test-MyInvocation" function (or more particularly a different function you have defined above) has files/dependencies it expects to find in the same directory where the ".\Test-MyInvocation.ps1" file resides
  #   - So, in order to avoid breaking things, we track the directory, and supply that directory path as an argument to the "-CurrentDirectoryOfTheTool" parameter

  Write-Host "Now running...:  'Test-MyInvocation -CurrentDirectoryOfTheTool $CurrentDirectoryOfTheTool'`n" -BackgroundColor Black -ForegroundColor Yellow

  Test-MyInvocation -CurrentDirectoryOfTheTool $CurrentDirectoryOfTheTool


  Start-Sleep -Seconds 10


}