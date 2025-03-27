@ECHO off
@REM Disabilita la visualizzazione dei comandi nella shell

@REM Verificare se Git è installato
git --version 


@REM Verificare se la directory del repository esiste
IF NOT EXIST "C:\\CASA\\GE_MARINO\\GE_CASA\\BANCA\\Notiziario\\" (
    ECHO [ERRORE] Directory del repository non trovata! >> GIT_LOG.txt
    EXIT /B 1
) ELSE (
    ECHO [INFO] Directory trovata: C:\CASA\GE_MARINO\GE_CASA\BANCA\Notiziario\ >> GIT_LOG.txt
)

@REM Spostarsi nella directory del repository
@CD /D c:\CASA\GE_MARINO\GE_CASA\BANCA\Notiziario\

@REM Creare o svuotare il file di log
ECHO. > GIT_LOG.txt
ECHO [LOG] Inizio esecuzione script >> GIT_LOG.txt

@ECHO.
@ECHO ================================================== >> GIT_LOG.txt
@ECHO ==================================================

ECHO.
@ECHO Mostrare il contenuto della directory per verifica
@ECHO [INFO] Contenuto della directory: >> GIT_LOG.txt
@DIR >> GIT_LOG.txt 2>&1

@ECHO ===================================================================
@ECHO 01 - GIT STATUS: Controllo dello stato del repository
@ECHO ===================================================================
@ECHO.
@ECHO [INFO] Controllo dello stato del repository... >> GIT_LOG.txt


git status >> temp_git_status.txt 2>&1
@IF %ERRORLEVEL% NEQ 0 (
    ECHO [ERRORE] git status ha fallito! >> GIT_LOG.txt
) ELSE (
    ECHO [INFO] Stato del repository: >> GIT_LOG.txt
    findstr /V "LF will be replaced by CRLF" temp_git_status.txt >> GIT_LOG.txt
)
DEL temp_git_status.txt

ECHO.
@ECHO ================================================== >> GIT_LOG.txt
ECHO ==================================================

@REM Pausa di 3 secondi per il controllo
TIMEOUT /T 3 /NOBREAK > NUL

@ECHO ===================================================================
@ECHO 02 - GIT PULL: Scaricare gli aggiornamenti dal repository remoto
@ECHO ===================================================================
ECHO.
ECHO [INFO] Scarico aggiornamenti dal web... >> GIT_LOG.txt

ECHO.
git pull >> GIT_LOG.txt 2>&1
@IF %ERRORLEVEL% NEQ 0 (
    ECHO [ERRORE] git pull ha fallito! >> GIT_LOG.txt
) ELSE (
    ECHO [INFO] Aggiornamenti scaricati con successo! >> GIT_LOG.txt
)

ECHO.
ECHO ================================================== >> GIT_LOG.txt
ECHO ==================================================

@REM Pausa di 5 secondi per il controllo
TIMEOUT /T 5 /NOBREAK > NUL

@REM ===================================================================
@REM 03 - GIT COMMIT: Aggiunta e commit delle modifiche
@REM ===================================================================

ECHO.
ECHO [INFO] Aggiunta e commit delle modifiche... >> GIT_LOG.txt

git add . >> GIT_LOG.txt 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO [ERRORE] git add ha fallito! >> GIT_LOG.txt
) ELSE (
    ECHO [INFO] Modifiche aggiunte con successo! >> GIT_LOG.txt
)

git commit -m "aggiornamento Notiziario Economico" >> GIT_LOG.txt 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO [ERRORE] git commit ha fallito! >> GIT_LOG.txt
) ELSE (
    ECHO [INFO] Commit effettuato con successo! >> GIT_LOG.txt
)

@ECHO.
@ECHO ================================================== >> GIT_LOG.txt
@ECHO ==================================================

@REM Pausa di 10 secondi per garantire il commit
TIMEOUT /T 10 /NOBREAK > NUL

@REM ===================================================================
@REM 04 - GIT PUSH: Invio delle modifiche al repository remoto
@REM ===================================================================

@ECHO.
@ECHO [INFO] Invio delle modifiche al repository remoto... >> GIT_LOG.txt

git push >> GIT_LOG.txt 2>&1
IF %ERRORLEVEL% NEQ 0 (
    @ECHO [ERRORE] git push ha fallito! >> GIT_LOG.txt
) ELSE (
    @ECHO [INFO] Modifiche inviate con successo al repository remoto! >> GIT_LOG.txt
)

@ECHO.
@ECHO ================================================== >> GIT_LOG.txt
@ECHO ==================================================

@REM Pausa di 3 secondi per il controllo finale
TIMEOUT /T 3 /NOBREAK > NUL

@ECHO.
@ECHO [INFO] Operazione completata con successo! >> GIT_LOG.txt
@ECHO ================================================== >> GIT_LOG.txt

EXIT
