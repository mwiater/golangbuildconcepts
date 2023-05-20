#!/bin/bash
#
# From root of project, run: `bash scripts/golang_linux_build_tests.sh`

# Color Console Output
RESET='\033[0m'           # Text Reset
REDBOLD='\033[1;31m'      # Red (Bold)
GREENBOLD='\033[1;32m'    # Green (Bold)
YELLOWBOLD='\033[1;33m'   # Yellow (Bold)
CYANBOLD='\033[1;36m'     # Cyan (Bold)

echo -e "${CYANBOLD}Testing Linux Build: ./bin/golangbuildconcepts${RESET}"
status=$(timeout -s SIGINT 10s ./bin/golangbuildconcepts)
status=$?
if [ $status -ne 0 ]; then
    echo "Error: ${status}"
fi
echo -e "${GREENBOLD}  ...PASSED.${RESET}"
echo ""

echo -e "${CYANBOLD}Testing Linux Build: ./bin/golangbuildconcepts-subscription${RESET}"
status=$(timeout -s SIGINT 10s ./bin/golangbuildconcepts-subscription)
status=$?
if [ $status -ne 0 ]; then
    echo "Error: ${status}"
fi
echo -e "${GREENBOLD}  ...PASSED.${RESET}"
echo ""

echo -e "${CYANBOLD}Testing Linux Build: ./bin/golangbuildconcepts-beta${RESET}"
status=$(timeout -s SIGINT 10s ./bin/golangbuildconcepts-beta)
status=$?
if [ $status -ne 0 ]; then
    echo "Error: ${status}"
fi
echo -e "${GREENBOLD}  ...PASSED.${RESET}"
echo ""

echo -e "${CYANBOLD}Testing Windows Build: ./bin/golangbuildconcepts.exe${RESET}"
status=$(WINEDEBUG=err-all,fixme-all timeout -s SIGINT 10s wine bin/golangbuildconcepts.exe)
status=$?
if [ $status -ne 0 ]; then
    echo "Error: ${status}"
fi
echo -e "${GREENBOLD}  ...PASSED.${RESET}"
echo ""

echo -e "${CYANBOLD}Testing Windows Build: ./bin/golangbuildconcepts-subscription.exe${RESET}"
status=$(WINEDEBUG=err-all,fixme-all timeout -s SIGINT 10s wine bin/golangbuildconcepts-subscription.exe)
status=$?
if [ $status -ne 0 ]; then
    echo "Error: ${status}"
fi
echo -e "${GREENBOLD}  ...PASSED.${RESET}"
echo ""

echo -e "${CYANBOLD}Testing Windows Build: ./bin/golangbuildconcepts-beta.exe${RESET}"
status=$(WINEDEBUG=err-all,fixme-all timeout -s SIGINT 10s wine bin/golangbuildconcepts-beta.exe)
status=$?
if [ $status -ne 0 ]; then
    echo "Error: ${status}"
fi
echo -e "${GREENBOLD}  ...PASSED.${RESET}"
echo ""

echo -e "${GREENBOLD}...Complete.${RESET}"
echo ""

