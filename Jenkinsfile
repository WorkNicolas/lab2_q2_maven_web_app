pipeline {
    agent any
    options {
        skipDefaultCheckout(true)
    }
    triggers {
        pollSCM('H/5 * * * *')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                bat '''
                    @echo off
                    setlocal

                    set "MVN_CMD="
                    where mvn >nul 2>&1
                    if not errorlevel 1 set "MVN_CMD=mvn"

                    if not defined MVN_CMD (
                        for /f "delims=" %%D in ('dir /b /ad /o-n "C:\\ProgramData\\chocolatey\\lib\\maven\\apache-maven-*" 2^>nul') do (
                            if not defined MVN_CMD set "MVN_CMD=C:\\ProgramData\\chocolatey\\lib\\maven\\%%D\\bin\\mvn.cmd"
                        )
                    )

                    if not defined MVN_CMD (
                        echo ERROR: Maven not found. Install Maven on this Jenkins agent or add it to PATH.
                        exit /b 1
                    )

                    echo Using Maven: %MVN_CMD%
                    call "%MVN_CMD%" -B clean package
                    set "MVN_EXIT=%ERRORLEVEL%"
                    exit /b %MVN_EXIT%
                '''
            }
        }
    }
}
