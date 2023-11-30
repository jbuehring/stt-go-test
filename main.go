package main

import (
    "fmt"
    "runtime/debug"
)

// var Version string = "development"

func main() {
    info, _ := debug.ReadBuildInfo()
    fmt.Println("Version: " + info.Main.Version)
    // fmt.Println("Version: " + Version)
}
