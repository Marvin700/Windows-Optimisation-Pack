$Host.UI.RawUI.WindowTitle = "GPU Treiber Cleaner | $([char]0x00A9) Marvin700" 
Start-BitsTransfer -Source "https://github.com/Marvin700/Windows_Optimisation_Pack/raw/main/DDU.zip" -Destination $env:temp\DDU.zip
Expand-Archive $env:temp\DDU.zip $env:temp
Set-Location $env:temp\DDU\
& '.\Display Driver Uninstaller.exe' -silent -removemonitors -cleannvidia -cleanamd -cleanintel -removephysx -removegfe -removenvbroadcast -removenvcp -removeintelcp -removeamdcp -restart