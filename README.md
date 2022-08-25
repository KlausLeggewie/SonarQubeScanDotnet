# SonarQube Scan for .NET Core

SonarQube is a static code analysis tool to improve code quality and identify security vulnerabilities of your code.
The aim is a local setup for a .NET Core code scan and also a reporting of the scan results via a local SonarQube server.

Uses the offical docker images provided by SonarQube.

## Sonar Server

The first step is to set up Sonar Server. The server is responsible for storing and reporting the scan results. The code scan transmits all results to the Sonar Server.

In the sonarserver directory execute:
```bash
docker compose up
```
Server will be up at http://localhost:9000

Next: 
1. Login (admin, admin), change password
2. Create a new project => the project key will be required later on
3. Generate a login token => will be required later on

## Sonar Scanner for .NET

The Sonar Scanner for .NET  runs locally and is installed in a .NET 6.0 SDK docker image.
Installation follows https://docs.sonarqube.org/latest/analysis/scan/sonarscanner-for-msbuild/ .

All configurations are done in the .env file:
* SONAR_PROJECT_KEY: key of sonar project defined by Sonar Server
* SONAR_URL: base url Sonar Server; find the IP address for the local Sonar Server:

        docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' sonarserver-sonarserver-1

* SONAR_TOKEN: token of scan-user, defined by Sonar Server
* DOTNET_SOURCE_DIR: local source directory, will be bound to /src
* DOTNET_BUILD_SOLUTION_PATH: path of solution or project, relative to /src

In the sonarscanner directory execute:
```bash
docker compose run dotnet
```

### Troubleshooting

| Error | Solution |
| ----- | -------- |
| "sh: 1: /usr/local/bin/dotnet-scan-build.sh: not found" | ensure that all files are stored with Unix line-endings (LF) |