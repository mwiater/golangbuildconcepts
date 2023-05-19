package main

import (
	"fmt"
	"os"
	"os/exec"
	"os/signal"
	"runtime"
	"syscall"
	"time"

	"github.com/mwiater/golangbuildconcepts/features"
	"github.com/mwiater/golangbuildconcepts/platforms"
	"github.com/rs/zerolog/log"
)

var AppReleaseVersion string
var loopTimeMs = 1000

func main() {
	if runtime.GOOS == "windows" {
		cmd := exec.Command("cmd", "/C", "cls")
		cmd.Stdout = os.Stdout
		err := cmd.Run()
		if err != nil {
			log.Fatal()
		}
	} else {
		cmd := exec.Command("clear")
		cmd.Stdout = os.Stdout
		err := cmd.Run()
		if err != nil {
			log.Fatal()
		}
	}

	for _, f := range features.Features {
		log.Info().Str("FeatureTier", features.FeatureTier).Str("Feature", f).Msg("Active Feature")
	}

	signalChannel := make(chan os.Signal, 1)
	signal.Notify(signalChannel, syscall.SIGINT, syscall.SIGTERM)
	go func() {
		<-signalChannel
		fmt.Println("\nShutting down.")
		// Cleanup here
		fmt.Println("\nShutdown complete.")
		os.Exit(0)
	}()

	tickerLoop()
}

func tickerLoop() {
	ticker := time.NewTicker(time.Duration(loopTimeMs) * time.Millisecond)
	for range ticker.C {
		log.Info().Str("release", AppReleaseVersion).Str("platform", platforms.Platform).Msg("App Tick")
	}
}
