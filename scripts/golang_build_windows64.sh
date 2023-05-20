#!/bin/bash
#
# From root of project, run: `bash scripts/golang_build_windows64.sh`

clear

# Color Console Output
RESET='\033[0m'           # Text Reset
REDBOLD='\033[1;31m'      # Red (Bold)
GREENBOLD='\033[1;32m'    # Green (Bold)
YELLOWBOLD='\033[1;33m'   # Yellow (Bold)
CYANBOLD='\033[1;36m'     # Cyan (Bold)

echo -e "${CYANBOLD}Formatting *.go files...${RESET}"
for i in *.go **/*.go ; do
  ERROR=$(gofmt -w "$i" 2>&1 1>/dev/null)
  status=$?
  if test $status -ne 0
  then
    echo -e "${REDBOLD}...Error: 'gofmt' command failed!${RESET}"
    echo -e "${REDBOLD}ERROR: ${ERROR}${RESET}"
    echo ""
    exit 1
  fi
  echo "  Formatted: $i"
done;
echo -e "${GREENBOLD}...Complete.${RESET}"
echo ""

echo -e "${CYANBOLD}Building Win64 Go binary:${RESET} ${GREENBOLD}GOOS=windows GOARCH=amd64 go build -ldflags "-X main.AppReleaseVersion=\$APPRELEASEVERSION" -o bin/golangbuildconcepts.exe .${RESET}"
ERROR=$(export APPRELEASEVERSION=$(git rev-list -1 HEAD) && GOOS=windows GOARCH=amd64 go build -ldflags "-X main.AppReleaseVersion=$APPRELEASEVERSION" -o bin/golangbuildconcepts.exe . 2>&1 1>/dev/null)
status=$?
if test $status -ne 0
then
	echo -e "${REDBOLD}ERROR:  'go build' command failed!${RESET}"
  echo -e "${REDBOLD}ERROR: ${ERROR}${RESET}"
  echo ""
  exit 1
fi
echo ""

echo -e "${GREENBOLD}Complete: Built Win64 go binary.${RESET}"
echo ""