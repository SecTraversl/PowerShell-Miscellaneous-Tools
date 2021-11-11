<#
.SYNOPSIS
  The "Get-SpecialFolderResolution" function enumerates the special folders on the system and returns the absolute path they resolve to.

.EXAMPLE
  PS C:\> $SpecialFolders = Get-SpecialFolderResolution
  PS C:\> $SpecialFolders | ft

  SpecialFolderName      ResolvedFolderPath
  -----------------      ------------------
  AdminTools             C:\Users\Jannus.Fugal\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Administrative Tools
  ApplicationData        C:\Users\Jannus.Fugal\AppData\Roaming
  CDBurning              C:\Users\Jannus.Fugal\AppData\Local\Microsoft\Windows\Burn\Burn
  CommonAdminTools       C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Administrative Tools
  CommonApplicationData  C:\ProgramData
  CommonDesktopDirectory C:\Users\Public\Desktop
  CommonDocuments        C:\Users\Public\Documents
  CommonMusic            C:\Users\Public\Music
  CommonOemLinks
  CommonPictures         C:\Users\Public\Pictures
  CommonProgramFiles     C:\Program Files\Common Files
  CommonProgramFilesX86  C:\Program Files (x86)\Common Files
  CommonPrograms         C:\ProgramData\Microsoft\Windows\Start Menu\Programs
  CommonStartMenu        C:\ProgramData\Microsoft\Windows\Start Menu
  CommonStartup          C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup
  CommonTemplates        C:\ProgramData\Microsoft\Windows\Templates
  CommonVideos           C:\Users\Public\Videos
  Cookies                C:\Users\Jannus.Fugal\AppData\Local\Microsoft\Windows\INetCookies
  Desktop                C:\Users\Jannus.Fugal\Desktop
  DesktopDirectory       C:\Users\Jannus.Fugal\Desktop
  Favorites              C:\Users\Jannus.Fugal\Favorites
  Fonts                  C:\WINDOWS\Fonts
  History                C:\Users\Jannus.Fugal\AppData\Local\Microsoft\Windows\History
  InternetCache          C:\Users\Jannus.Fugal\AppData\Local\Microsoft\Windows\INetCache
  LocalApplicationData   C:\Users\Jannus.Fugal\AppData\Local
  LocalizedResources
  MyComputer
  MyDocuments            C:\Users\Jannus.Fugal\Documents
  MyMusic                C:\Users\Jannus.Fugal\Music
  MyPictures             C:\Users\Jannus.Fugal\Pictures
  MyVideos               C:\Users\Jannus.Fugal\Videos
  NetworkShortcuts       C:\Users\Jannus.Fugal\AppData\Roaming\Microsoft\Windows\Network Shortcuts
  Personal               C:\Users\Jannus.Fugal\Documents
  PrinterShortcuts       C:\Users\Jannus.Fugal\AppData\Roaming\Microsoft\Windows\Printer Shortcuts
  ProgramFiles           C:\Program Files
  ProgramFilesX86        C:\Program Files (x86)
  Programs               C:\Users\Jannus.Fugal\AppData\Roaming\Microsoft\Windows\Start Menu\Programs
  Recent                 C:\Users\Jannus.Fugal\AppData\Roaming\Microsoft\Windows\Recent
  Resources              C:\WINDOWS\resources
  SendTo                 C:\Users\Jannus.Fugal\AppData\Roaming\Microsoft\Windows\SendTo
  StartMenu              C:\Users\Jannus.Fugal\AppData\Roaming\Microsoft\Windows\Start Menu
  Startup                C:\Users\Jannus.Fugal\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
  System                 C:\WINDOWS\system32
  SystemX86              C:\WINDOWS\SysWOW64
  Templates              C:\Users\Jannus.Fugal\AppData\Roaming\Microsoft\Windows\Templates
  UserProfile            C:\Users\Jannus.Fugal
  Windows                C:\WINDOWS



  Here we run the function and display the output.

.NOTES
  Name:  Get-SpecialFolderResolution.ps1
  Author:  Travis Logue
  Version History:  1.1 | 2021-11-11 | Initial Version
  Dependencies:  
  Notes:
  - This is where I got the body of the code:  https://stackoverflow.com/questions/16658015/how-can-i-use-powershell-to-call-shgetknownfolderpath
  - This seemed somewhat related but is focused on "set" and not "get":  https://gist.github.com/josy1024/5cca8a66bfdefb12abff1721ff44f35f
  - Lee Holmes and p/invoke walkthrough:  https://www.leeholmes.com/powershell-pinvoke-walkthrough/
  - Information on using an "Enum" in PowerShell:  https://social.technet.microsoft.com/wiki/contents/articles/26436.how-to-create-and-use-enums-in-powershell.aspx

  .
#>
function Get-SpecialFolderResolution {
  [CmdletBinding()]
  param ()
  
  begin {}
  
  process {
    
    $SpecialFolderNames = [Enum]::GetNames([Environment+SpecialFolder]) | Sort-Object
    foreach ($folder in $SpecialFolderNames) {
      $ResolvedFolderPath = [System.Environment]::GetFolderPath($folder)

      $prop = [ordered]@{
        SpecialFolderName = $folder
        ResolvedFolderPath = $ResolvedFolderPath
      }
      $obj = New-Object -TypeName psobject -Property $prop
      Write-Output $obj
    }

  }
  
  end {}
}