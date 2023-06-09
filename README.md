# Golang Binary Concepts

Learn how to build Golang binaries targeting different platforms and include varying features from the same codebase.

Example application for the article: [Golang: Building Binaries with Different Features and Options from the Same Codebase](
https://betterprogramming.pub/golang-building-binaries-with-different-features-and-options-from-the-same-codebase-118fef52340b)

## Installation

```
git clone git@github.com:mwiater/golangbuildconcepts.git
cd golangbuildconcepts
go get
```

## Application

The [article I wrote](
https://betterprogramming.pub/golang-building-binaries-with-different-features-and-options-from-the-same-codebase-118fef52340b) is based on how changes can be made during the run and build stages, rather than code changes, so **this example app does only one thing: logs the effects of the changes we’re making during the run and build stages.** While worthless as an application that actually does something, for illustration purposes, it has a few benefits:

* Displays the evidence of the build changes via logging when execution commands are modified.
* Keeps things simple and illustrates the concepts without getting mired down in overly-complex code, yet still gives examples of implementing the changes.

Example output:

```
{"level":"info","FeatureTier":"subscriptionTier","Feature":"Free Feature #1","time":"2023-05-20T23:30:24Z","message":"Active Feature"}
{"level":"info","FeatureTier":"subscriptionTier","Feature":"Free Feature #2","time":"2023-05-20T23:30:24Z","message":"Active Feature"}
{"level":"info","FeatureTier":"subscriptionTier","Feature":"Subscription Tier: Feature #1","time":"2023-05-20T23:30:24Z","message":"Active Feature"}
{"level":"info","FeatureTier":"subscriptionTier","Feature":"Subscription Tier: Feature #2","time":"2023-05-20T23:30:24Z","message":"Active Feature"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:25Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:26Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:27Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:28Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:29Z","message":"App Tick"}
```

### Convenience Commands

**NOTE:** _This repository was created to run on a linux x86 machine. There are example `make` commands and scripts to cross-compile to other architectures, but these convenience methods have only been tested from a linux x86 source (though the corss-compiled binaries have been successfully tested on the appropriate source architectures). If you are on another source architecture, native `go` commands should work fine, but the build scripts included here may not. See the `./scripts` directory to see what the bash scripts are doing--you should be able to infer the native `go` commands for your system, if you have issues executing any of the convenience scripts._

Type `make` for a list of commands (comments added for clarity):

```
Targets in this Makefile:

make golang-build-linux64
make golang-build-linux64-beta
make golang-build-linux64-subscription
make golang-build-windows64
make golang-build-windows64-beta
make golang-build-windows64-subscription
make golang-run

For details on these commands, see the bash scripts in the 'scripts/' directory.
```

## Run the application

Type: `make golang-run`

Note: This command only runs the the base application with the free tier flag. For details on running the application with other flags, see the article: [Golang: Golang: Building Binaries with Different Features and Options from the Same Codebase](
https://betterprogramming.pub/golang-building-binaries-with-different-features-and-options-from-the-same-codebase-118fef52340b)

Or, build and execute the specific binaries via `make`, e.g.:

Build: `make golang-build-linux64-beta`

Run: `./bin/golangbuildconcepts-beta`


## Bonus: Testing Application Binaries for Different Platforms from the Same Docker Container

As an avid Docker user, I chose to go the container route to test the application binaries. This has a few benefits:

* A completely clean install and build environment for the application.
* The ability (via [Wine](https://www.winehq.org/)) to run both Linux and Windows binaries.

The Dockerfile is doing some heavy lifting, so building the image may take some time, maybe a few minutes.

```
clear && docker build -t golangbuildconcepts . && \
  docker run -it --rm golangbuildconcepts
```
This will build and run a temporary container, execute the Linux and Windows binaries,and display the output for each for 10 seconds before moving on to the next test. As noted by the example output below, each binary is run for an amount of time (10 seconds), reports the proper "platform", and is terminated successfully by a signal.

```
Testing Linux Build: ./bin/golangbuildconcepts
{"level":"info","FeatureTier":"freeTier","Feature":"Free Feature #1","time":"2023-05-20T23:30:14Z","message":"Active Feature"}
{"level":"info","FeatureTier":"freeTier","Feature":"Free Feature #2","time":"2023-05-20T23:30:14Z","message":"Active Feature"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:15Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:16Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:17Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:18Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:19Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:20Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:21Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:22Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:23Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:24Z","message":"App Tick"}
  ...PASSED.

Testing Linux Build: ./bin/golangbuildconcepts-subscription
{"level":"info","FeatureTier":"subscriptionTier","Feature":"Free Feature #1","time":"2023-05-20T23:30:24Z","message":"Active Feature"}
{"level":"info","FeatureTier":"subscriptionTier","Feature":"Free Feature #2","time":"2023-05-20T23:30:24Z","message":"Active Feature"}
{"level":"info","FeatureTier":"subscriptionTier","Feature":"Subscription Tier: Feature #1","time":"2023-05-20T23:30:24Z","message":"Active Feature"}
{"level":"info","FeatureTier":"subscriptionTier","Feature":"Subscription Tier: Feature #2","time":"2023-05-20T23:30:24Z","message":"Active Feature"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:25Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:26Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:27Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:28Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:29Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:30Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:31Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:32Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:33Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:34Z","message":"App Tick"}
  ...PASSED.

Testing Linux Build: ./bin/golangbuildconcepts-beta
{"level":"info","FeatureTier":"betaTier","Feature":"Free Feature #1","time":"2023-05-20T23:30:34Z","message":"Active Feature"}
{"level":"info","FeatureTier":"betaTier","Feature":"Free Feature #2","time":"2023-05-20T23:30:34Z","message":"Active Feature"}
{"level":"info","FeatureTier":"betaTier","Feature":"Subscription Tier: Feature #1","time":"2023-05-20T23:30:34Z","message":"Active Feature"}
{"level":"info","FeatureTier":"betaTier","Feature":"Subscription Tier: Feature #2","time":"2023-05-20T23:30:34Z","message":"Active Feature"}
{"level":"info","FeatureTier":"betaTier","Feature":"Beta Tier: Feature #1","time":"2023-05-20T23:30:34Z","message":"Active Feature"}
{"level":"info","FeatureTier":"betaTier","Feature":"Beta Tier: Feature #2","time":"2023-05-20T23:30:34Z","message":"Active Feature"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:35Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:36Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:37Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:38Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:39Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:40Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:41Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:42Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:43Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"linux","time":"2023-05-20T23:30:44Z","message":"App Tick"}
  ...PASSED.

Testing Windows Build: ./bin/golangbuildconcepts.exe
{"level":"info","FeatureTier":"freeTier","Feature":"Free Feature #1","time":"2023-05-20T23:30:50Z","message":"Active Feature"}
{"level":"info","FeatureTier":"freeTier","Feature":"Free Feature #2","time":"2023-05-20T23:30:50Z","message":"Active Feature"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:30:51Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:30:52Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:30:53Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:30:54Z","message":"App Tick"}
  ...PASSED.

Testing Windows Build: ./bin/golangbuildconcepts-subscription.exe
{"level":"info","FeatureTier":"subscriptionTier","Feature":"Free Feature #1","time":"2023-05-20T23:30:56Z","message":"Active Feature"}
{"level":"info","FeatureTier":"subscriptionTier","Feature":"Free Feature #2","time":"2023-05-20T23:30:56Z","message":"Active Feature"}
{"level":"info","FeatureTier":"subscriptionTier","Feature":"Subscription Tier: Feature #1","time":"2023-05-20T23:30:56Z","message":"Active Feature"}
{"level":"info","FeatureTier":"subscriptionTier","Feature":"Subscription Tier: Feature #2","time":"2023-05-20T23:30:56Z","message":"Active Feature"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:30:57Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:30:58Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:30:59Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:00Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:01Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:02Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:03Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:04Z","message":"App Tick"}
  ...PASSED.

Testing Windows Build: ./bin/golangbuildconcepts-beta.exe
{"level":"info","FeatureTier":"betaTier","Feature":"Free Feature #1","time":"2023-05-20T23:31:06Z","message":"Active Feature"}
{"level":"info","FeatureTier":"betaTier","Feature":"Free Feature #2","time":"2023-05-20T23:31:06Z","message":"Active Feature"}
{"level":"info","FeatureTier":"betaTier","Feature":"Subscription Tier: Feature #1","time":"2023-05-20T23:31:06Z","message":"Active Feature"}
{"level":"info","FeatureTier":"betaTier","Feature":"Subscription Tier: Feature #2","time":"2023-05-20T23:31:06Z","message":"Active Feature"}
{"level":"info","FeatureTier":"betaTier","Feature":"Beta Tier: Feature #1","time":"2023-05-20T23:31:06Z","message":"Active Feature"}
{"level":"info","FeatureTier":"betaTier","Feature":"Beta Tier: Feature #2","time":"2023-05-20T23:31:06Z","message":"Active Feature"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:07Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:08Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:09Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:10Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:11Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:12Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:13Z","message":"App Tick"}
{"level":"info","release":"6266e64041311e0d147448c4bace357f77e0f370","platform":"windows","time":"2023-05-20T23:31:14Z","message":"App Tick"}
  ...PASSED.

...Complete.
```
