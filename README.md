SonarQube with Python and Flake8
===================

[SonarQube](http://www.sonarqube.org/) is an open source quality management platform for analyzing and managing quality metrics, such as test coverage, code complexity, standards/rule violations. This module uses a modified Python plugin which adds [Flake8](https://flake8.readthedocs.org/en/2.2.3/warnings.html) rules to the default set of [Pylint](http://pylint-messages.wikidot.com/all-codes) rules.


### Includes
- [Flake8 Python Plugin](https://github.com/SonarCommunity/sonar-python/pull/1) modified from [Python Plugin](http://docs.codehaus.org/display/SONAR/Python+Plugin)
- [JIRA Plugin](http://docs.codehaus.org/display/SONAR/JIRA+Plugin)
- [SCM Activity](http://docs.codehaus.org/display/SONAR/SCM+Activity+Plugin)
- PostgreSQL Database

### Prerequisites




### Using Sonar with Jenkins
- Install the SonarQube plugin on Jenkins
- Follow [these steps](http://docs.codehaus.org/display/SONAR/Configuring+SonarQube+Jenkins+Plugin) to configure your Jenkins project. The database username and password are set in init.pp and both default to "sonar." When adding a Sonar Runner, use the "Install automatically" option.

Other Configuration Values:
```
Database URL: jdbc:postgresql://<sonar-uri>/sonar
Database driver:	org.postgresql.Driver
```

- Follow [these steps](http://docs.codehaus.org/display/SONAR/Triggering+SonarQube+on+Jenkins+Job#TriggeringSonarQubeonJenkinsJob-TriggeringaProjectAnalysiswiththeSonarQubeRunner) to configure a project to run Sonar analysis. Include the following in the project properties.
```
# required metadata
sonar.projectKey=<project:key>
sonar.projectName=<name>
sonar.projectVersion=<version>

# path to source directories (required)
sonar.sources=<source directory>

# path to test source directories (optional)
# sonar.tests=testDir1,testDir2

# path to project binaries (optional), for example directory of Java bytecode
# sonar.binaries=binDir

# Uncomment this line to analyse a project which is not a java project.
# The value of the property must be the key of the language.
sonar.language=py
sonar.sourceEncoding=UTF-8
sonar.python.coverage.reportPath=coverage.xml

# Flake8 Configuration
sonar.python.flake8_config=tox.ini
```
