#!/bin/bash
echo "** started dotnet-scan-build"

DOTNET_BUILD_SOLUTION_PATH="/src/"${DOTNET_BUILD_SOLUTION_PATH}

echo ${SONAR_PROJECT_KEY}
echo ${SONAR_URL}
echo ${SONAR_TOKEN}
echo ${DOTNET_BUILD_SOLUTION_PATH}

echo "** install dotnet scanner"
export LC_ALL=C.UTF-8
dotnet tool install --global dotnet-sonarscanner --version 5.5.3
dotnet tool install --global dotnet-reportgenerator-globaltool
export PATH="$PATH:/root/.dotnet/tools"
apt update && apt install -yyq openjdk-11-jre
echo "** dotnet sonarscanner begin"
dotnet sonarscanner begin /k:${SONAR_PROJECT_KEY} /d:sonar.host.url=${SONAR_URL} /d:sonar.login=${SONAR_TOKEN}
echo "** dotnet build"
dotnet build ${DOTNET_BUILD_SOLUTION_PATH}
echo "** dotnet sonarscanner end"
dotnet sonarscanner end /d:sonar.login=${SONAR_TOKEN}
echo "** finished dotnet-scan-build"
