#!/bin/bash
#
# From root of project, run: `bash scripts/golang_linux_build_tests.sh`

# Color Console Output
RESET='\033[0m'           # Text Reset
REDBOLD='\033[1;31m'      # Red (Bold)
GREENBOLD='\033[1;32m'    # Green (Bold)
YELLOWBOLD='\033[1;33m'   # Yellow (Bold)
CYANBOLD='\033[1;36m'     # Cyan (Bold)

echo -e "${CYANBOLD}Tesing: ./bin/golangbuildconcepts${RESET}"
status=$(timeout -s SIGINT 10s ./bin/golangbuildconcepts)
status=$?
if [ $status -ne 0 ]; then
    echo "Error: ${status}"
fi
echo -e "${GREENBOLD}  ...PASSED.${RESET}"
echo ""

echo -e "${CYANBOLD}Tesing: ./bin/golangbuildconcepts-subscription${RESET}"
status=$(timeout -s SIGINT 10s ./bin/golangbuildconcepts-subscription)
status=$?
if [ $status -ne 0 ]; then
    echo "Error: ${status}"
fi
echo -e "${GREENBOLD}  ...PASSED.${RESET}"
echo ""

echo -e "${CYANBOLD}Tesing: ./bin/golangbuildconcepts-beta${RESET}"
status=$(timeout -s SIGINT 10s ./bin/golangbuildconcepts-beta)
status=$?
if [ $status -ne 0 ]; then
    echo "Error: ${status}"
fi
echo -e "${GREENBOLD}  ...PASSED.${RESET}"
echo ""

echo -e "${GREENBOLD}...Complete.${RESET}"
echo ""