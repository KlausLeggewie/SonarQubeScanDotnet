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
(tbc)
