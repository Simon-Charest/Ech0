# Ech0
Flipper Zero scripts.

## Built With

### Backend
- [Python](https://www.python.org/);

### Libraries
- [pytest](https://docs.pytest.org/);
- [uFBT](https://github.com/flipperdevices/flipperzero-ufbt/);

### Virtual Environment
- [venv](https://docs.python.org/library/venv/);

### Package Management System
- [pip](https://pip.pypa.io/);

### Integrated Development Environment (IDE)
- [Visual Studio Code](https://code.visualstudio.com/);

### AI System
- [ChatGPT](https://chat.openai.com/).

## Getting Started

### Installation
1. Install [Python](https://www.python.org/downloads/);
2. Install [Visual Studio Code](https://code.visualstudio.com/download/);
3. Clone solution:
```
C:
mkdir C:\source
cd C:\source
git clone https://github.com/Simon-Charest/ech0.git
cd C:\source\ech0
```
4. Open solution with Visual Studio Code;
5. Create virtual environment:
```
python -m venv .venv
```
6. Activate virtual environment:
```
.venv\Scripts\Activate.ps1
```
7. Upgrade pip:
```
python -m pip install -U pip
```
8. Install requirements:
```
pip install -r requirements.txt
```
9. Run solution:
```
python ech0
```
10. Run tests:
```
pytest
```
11. Create the Flipper Application Manifest (.fam):
```
mkdir C:\source\ech0\apps\hello_world
cd C:\source\ech0\apps\hello_world
ufbt vscode_dist create APPID=hello_world
ufbt fap_hello_world
```

## License
- Distributed under the [MIT License](https://opensource.org/license/mit/). See [LICENSE.txt](./LICENSE.txt) for more information.

## Contact
- GitHub: [Ech0](https://github.com/Simon-Charest/ech0);
- Email: [Simon Charest](mailto:simoncharest@gmail.com).

## Acknowledgements
- [example_custom_font](https://github.com/flipperdevices/flipperzero-firmware/tree/dev/applications/examples/example_custom_font);
- [Flipper Lab](https://lab.flipper.net/apps);
- [Flipper Zero Documentation](https://docs.flipper.net/);
- [Flipper Zero Web Serial Terminal](https://googlechromelabs.github.io/serial-terminal/);
- [flipper-image-test](https://github.com/kbembedded/flipper-image-test)
- [Get started with the Dev Board](https://docs.flipper.net/development/hardware/wifi-developer-board/get-started).
