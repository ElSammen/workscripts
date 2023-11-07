REM This script is to run on a fresh PC to automate some of the setup and testing. Liam Salmon wrote this, that's Liam Salmon, handsome and big brained Liam Salmon.
slui 3 /q
diskmgmt.msc /q
Start ""  "C:\Program Files (x86)\IOBit\Driver Booster\10.5.0\DriverBooster.exe"

setlocal enabledelayedexpansion

setlocal enabledelayedexpansion

for %%D in (D:) do (
    if exist %%D\OCCT.exe (
        start %%D\OCCT.exe
        exit
    ) else (
        echo OCCT.exe not found on drive D:
        for %%D in (E:) do (
            start %%D\OCCT.exe
            exit
        ) else (
            echo OCCT.exe not found on drive E:
            for %%D in (F:) do (
                start %%D\OCCT.exe
                exit
            ) else (
                echo damn bro OCCT.exe not found on drive F either I mean damn what can you do really, guess you could do it manually
            )
        ) 
    ) 

)



for /F "tokens=* skip=1" %%n in ('WMIC path Win32_VideoController get name ^| findstr "."') do (
    set "GPU_NAME=%%n"
    set "GPU_NAME=!GPU_NAME:*NVIDIA*=NVIDIA!"
    set "GPU_NAME=!GPU_NAME:*AMD*=AMD!"
)

echo %GPU_NAME%

if "!GPU_NAME!"=="NVIDIA" (
    echo GPU is NVIDIA
    start https://www.nvidia.co.uk/Download/index.aspx?lang=en-uk
) else if "!GPU_NAME!"=="AMD" (
    echo AMD
    start https://www.amd.com/en/support
) else (
    echo Error, do it manually
    goto :eof
)

PAUSE
