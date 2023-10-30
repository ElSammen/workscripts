REM This script is to run on a fresh PC to automate some of the setup and testing. Liam Salmon wrote this, that's Liam Salmon, handsome and big brained Liam Salmon.
slui 3 /q
diskmgmt.msc /q
Start ""  "C:\Program Files (x86)\IOBit\Driver Booster\10.5.0\DriverBooster.exe"

setlocal enabledelayedexpansion

for %%D in (D: E: F:) do (
    if exist %%D\OCCT.exe (
        start %%D\OCCT.exe
        exit
    ) else (
        echo OCCT.exe not found on drives D:, E:, or F:.
    )
)



for /F "tokens=*" %%n in ('WMIC path Win32_VideoController get name ^| findstr "."') do set GPU_NAME=%%n

echo %GPU_NAME%

if "%GPU_NAME%" == "NVIDIA" (
    echo GPU is NVIDIA
    start https://www.nvidia.co.uk/Download/index.aspx?lang=en-uk
) else if "%GPU_NAME%" == "AMD" (
    echo AMD
    start https://www.amd.com/en/support
) else (
    echo Error, do it manually
    goto :eof
)


PAUSE
