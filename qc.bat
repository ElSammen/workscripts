@ECHO OFF

ECHO If you see this, no, you didn't.
slui 3
start "" "C:\Program Files (x86)\IObit\Driver Booster\DriverBooster.exe"
for /F "tokens=* skip=1" %%n in ('WMIC path Win32_VideoController get Name ^| findstr "."') do set GPU_NAME=%%n

echo %GPU_NAME% | find "NVIDIA" >nul && set GPU_NAME=NVIDIA || set GPU_NAME=AMD

if "%GPU_NAME%" == "NVIDIA" (
    echo NVIDIA
    start https://www.nvidia.co.uk/Download/index.aspx?lang=en-uk
) else (
    echo AMD
    start https://www.amd.com/en/support
)

PAUSE