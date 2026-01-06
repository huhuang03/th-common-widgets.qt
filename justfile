set windows-shell := ["powershell.exe", "-NoLogo", "-Command"]

build:
    cmake -B build --preset vcpkg .
    cmake --build build
    cmake --install build

