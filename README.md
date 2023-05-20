# Golang Binary Concepts

Learn how to build Golang binaries targeting different platforms and include varying features from the same codebase.

Example application for the article: [Golang: Building Binaries with Different Features and Options from the Same Codebase](
https://medium.com/@matt.wiater/golang-building-binaries-with-different-features-and-options-from-the-same-codebase-118fef52340b)

## Notes

### Docker build tests
clear && docker build -t golangbuildconcepts . && \
  docker run -it --rm --entrypoint "/bin/bash" golangbuildconcepts

clear && docker build -t golangbuildconcepts . && \
  docker run -it --rm golangbuildconcepts

### App Signal Tests
export APPRELEASEVERSION=$(git rev-list -1 HEAD) && timeout -s SIGINT 5s go run -ldflags "-X main.AppReleaseVersion=$APPRELEASEVERSION" .
export APPRELEASEVERSION=$(git rev-list -1 HEAD) && timeout -s SIGTERM 5s go run -ldflags "-X main.AppReleaseVersion=$APPRELEASEVERSION" .
export APPRELEASEVERSION=$(git rev-list -1 HEAD) && timeout -s SIGQUIT 5s go run -ldflags "-X main.AppReleaseVersion=$APPRELEASEVERSION" .
export APPRELEASEVERSION=$(git rev-list -1 HEAD) && timeout -s SIGHUP 5s go run -ldflags "-X main.AppReleaseVersion=$APPRELEASEVERSION" .
