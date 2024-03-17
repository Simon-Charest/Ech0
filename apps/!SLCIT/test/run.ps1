.\hello_world.bat
.\hello_world.ps1
.\hello_world_c.exe
.\hello_world_cpp.exe
java hello_world
python hello_world.py
[System.Text.Encoding]::ASCII.GetString((Invoke-WebRequest -Uri file:///$PWD/hello_world.html).Content)
[System.Text.Encoding]::ASCII.GetString((Invoke-WebRequest -Uri file:///$PWD/hello_world.js).Content)
