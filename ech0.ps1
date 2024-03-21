function Main ()
{
    do
    {
        Clear-Host
        Write-Host @"
╔═════════════════╤══════════════════╗
║   ┏┓┓ ┏┓┳┏┳┓    │     ┏┓ ┓ ┏┓      ║
║   ┗┓┃ ┃ ┃ ┃     │     ┣ ┏┣┓┃┫      ║
║   ┗┛┗┛┗┛┻ ┻     │     ┗┛┗┛┗┗┛      ║
╟─────────────────┴──────────────────╢
║ 1. Activate virtual environment    ║
║ 2. Deactivate virtual environment  ║
║ 3. Build Hello World ! application ║
║ 4. Build Test applications         ║
║ 5. Open Flipper Lab                ║
║ 6. Open Serial Terminal            ║
║ 7. Exit                            ║
╚════════════════════════════════════╝
"@ -ForegroundColor Green
        [int] $choice = Read-Host "Choice"

        switch ($choice)
        {
            1 { .venv\Scripts\Activate.ps1 }
            2 { deactivate }
            3 {
                [string] $BUILD_PATH = "$Env:UserProfile\.ufbt\build"
                [string] $APP_PATH = "$PWD\apps\!SLCIT\hello_world"
                [string] $PROJECT_NAME = "fap_hello_world"
                [string] $APP_BINARY = "$BUILD_PATH\hello_world.fap"

                # Save current directory
                [string] $currentDirectory = Get-Location
                
                # Delete build directory
                Remove-Item -Path $BUILD_PATH -Recurse -Force -ErrorAction SilentlyContinue

                # Go to app directory
                Set-Location $APP_PATH

                # Build app
                ufbt $PROJECT_NAME

                # Copy application binary
                Copy-Item $APP_BINARY $APP_PATH -ErrorAction SilentlyContinue

                # Go back to current directory
                Set-Location $currentDirectory

                pause
            }
            4 { . "$PWD\apps\!SLCIT\test\build.ps1" }
            5 { Start-Process microsoft-edge:"https://lab.flipper.net/" }
            6 { Start-Process microsoft-edge:"https://googlechromelabs.github.io/serial-terminal/" }
        }
    }
    while ($choice -ne 7)
}

Main
