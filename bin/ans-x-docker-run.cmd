@echo off
REM Run the Ansible docker image
REM This script is called from the other one

SET SCRIPT_PATH=%~dp0

REM set the azure configuration
REM you need to copy the file azure-conf-dist.cmd to azure-conf.cmd and set your value
SET AZURE_CONF_FILE=azure-conf.cmd

if exist %AZURE_CONF_FILE% (
   call %AZURE_CONF_FILE%
)

if "%ANS_X_DOCKER_TAG%"=="" (
    SET ANS_X_DOCKER_TAG=2.9
)

if "%1" == "bash" (
  SET ENTRY_POINT=--entrypoint /ansible/bin/entrypoint.sh
  REM the input device is not a TTY. If you are using mintty, try prefixing the command with 'winpty'
  REM docker should not run as an interactive session (only for the docker-bash script)
  SET INTERACTIVE=-it
) else (
  SET ENTRY_POINT=
  SET INTERACTIVE=
)

REM Fixed working directory in the Dockerfile
SET ANS_X_DOCKER_IMAGE_PROJECT_DIR=/ansible/playbooks


if not defined ANSIBLE_CONFIG (SET ANSIBLE_CONFIG=ansible.cfg)
if not defined ANSIBLE_HOME (SET ANSIBLE_HOME=%ANS_X_DOCKER_IMAGE_PROJECT_DIR%)

echo Ansible Env Inside Docker:
echo ANS_X_DOCKER_TAG : %ANS_X_DOCKER_TAG%
echo ANSIBLE_CONFIG : %ANS_X_DOCKER_IMAGE_PROJECT_DIR%/%ANSIBLE_CONFIG%
echo ANSIBLE_HOME   : %ANS_X_DOCKER_IMAGE_PROJECT_DIR%/%ANSIBLE_HOME%
echo

REM no name is given to the container because otherwise it's not possible to start two ansible session
docker run ^
	--rm ^
	%INTERACTIVE% ^
	-v %cd%:%ANS_X_DOCKER_IMAGE_PROJECT_DIR% ^
	--env AZURE_CLIENT_ID=%AZURE_CLIENT_ID% ^
	--env AZURE_SECRET=%AZURE_SECRET% ^
	--env AZURE_SUBSCRIPTION_ID=%AZURE_SUBSCRIPTION_ID% ^
	--env AZURE_TENANT=%AZURE_TENANT% ^
	--env ANSIBLE_CONFIG=%ANS_X_DOCKER_IMAGE_PROJECT_DIR%/%ANSIBLE_CONFIG% ^
	--env ANSIBLE_HOME=%ANS_X_DOCKER_IMAGE_PROJECT_DIR%/%ANSIBLE_HOME% ^
	--env ANSIBLE_LOCAL_TEMP=/tmp ^
	--user ansible ^
	%ENTRY_POINT% ^
	gerardnico/ansible:%ANS_X_DOCKER_TAG% ^
	%*
