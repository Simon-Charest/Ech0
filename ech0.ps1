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
║ 4. Open Flipper Lab                ║
║ 5. Open Serial Terminal            ║
║ 6. Exit                            ║
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
                cd $APP_PATH

                # Build app
                ufbt $PROJECT_NAME

                # Copy application binary
                cp $APP_BINARY $APP_PATH -ErrorAction SilentlyContinue

                # Go back to current directory
                cd $currentDirectory

                pause
            }
            4 { start microsoft-edge:"https://lab.flipper.net/" }
            5 { start microsoft-edge:"https://googlechromelabs.github.io/serial-terminal/" }
        }
    }
    while ($choice -ne 6)
}

Main
