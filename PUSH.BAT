@REM ===================================================================
@REM Script per la gestione del repository Git
@REM ===================================================================

@ECHO OFF  @REM Disabilita la visualizzazione dei comandi nella shell

@REM Verificare se Git è installato
WHERE git >NUL 2>NUL
IF %ERRORLEVEL% NEQ 0 (
    ECHO [ERRORE] Git non trovato! Assicurati che sia installato e aggiunto a PATH. >> GIT_LOG.txt
    ECHO [ERRORE] Git non trovato! Assicurati che sia installato e aggiunto a PATH.
    EXIT /B 1
)

@REM Verificare se la directory esiste
IF NOT EXIST "C:\CASA\GE_MARINO\GE_CASA\BANCA\Notiziario\" (
    ECHO [ERRORE] Directory del repository non trovata! >> GIT_LOG.txt
    ECHO [ERRORE] Directory del repository non trovata!
    EXIT /B 1
)

@REM Spostarsi nella directory del repository
CD /D c:\CASA\GE_MARINO\BANCA\Notiziario\

@REM Creare o svuotare il file di log
ECHO. > GIT_LOG.txt
ECHO [LOG] Inizio esecuzione script >> GIT_LOG.txt
ECHO [LOG] Inizio esecuzione script

ECHO ================================================== >> GIT_LOG.txt
ECHO ==================================================

@REM Mostrare il contenuto della directory per verifica
DIR >> GIT_LOG.txt 2>&1
DIR
ECHO ================================================== >> GIT_LOG.txt
ECHO ==================================================

@REM ===================================================================
@REM 01 - GIT STATUS: Controllo dello stato del repository
@REM ===================================================================
ECHO [INFO] Controllo dello stato del repository... >> GIT_LOG.txt
ECHO [INFO] Controllo dello stato del repository...

git status > temp_git_status.txt 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO [ERRORE] git status ha fallito! >> GIT_LOG.txt
    ECHO [ERRORE] git status ha fallito!
) ELSE (
    findstr /V "LF will be replaced by CRLF" temp_git_status.txt >> GIT_LOG.txt
    findstr /V "LF will be replaced by CRLF" temp_git_status.txt
)
DEL temp_git_status.txt

ECHO ================================================== >> GIT_LOG.txt
ECHO ==================================================

@REM Pausa di 3 secondi per il controllo
TIMEOUT /T 3 /NOBREAK > NUL

@REM ===================================================================
@REM 02 - GIT PULL: Scaricare gli aggiornamenti dal repository remoto
@REM ===================================================================
ECHO [INFO] Scarico aggiornamenti dal web... >> GIT_LOG.txt
ECHO [INFO] Scarico aggiornamenti dal web...

git pull >> GIT_LOG.txt 2>&1
git pull

ECHO ================================================== >> GIT_LOG.txt
ECHO ==================================================

@REM Pausa di 5 secondi per il controllo
TIMEOUT /T 5 /NOBREAK > NUL

@REM ===================================================================
@REM 03 - GIT COMMIT: Aggiunta e commit delle modifiche
@REM ===================================================================
ECHO [INFO] Aggiunta e commit delle modifiche... >> GIT_LOG.txt
ECHO [INFO] Aggiunta e commit delle modifiche...

git add . >> GIT_LOG.txt 2>&1
git add .

IF %ERRORLEVEL% NEQ 0 ECHO [ERRORE] git add ha fallito! >> GIT_LOG.txt
IF %ERRORLEVEL% NEQ 0 ECHO [ERRORE] git add ha fallito!

git commit -m "aggiornamento Notiziario Economico" >> GIT_LOG.txt 2>&1
git commit -m "aggiornamento Notiziario Economico"

IF %ERRORLEVEL% NEQ 0 ECHO [ERRORE] git commit ha fallito! >> GIT_LOG.txt
IF %ERRORLEVEL% NEQ 0 ECHO [ERRORE] git commit ha fallito!

ECHO ================================================== >> GIT_LOG.txt
ECHO ==================================================

@REM Pausa di 10 secondi per garantire il commit
TIMEOUT /T 10 /NOBREAK > NUL

@REM ===================================================================
@REM 04 - GIT PUSH: Invio delle modifiche al repository remoto
@REM ===================================================================
ECHO [INFO] Invio delle modifiche al repository remoto... >> GIT_LOG.txt
ECHO [INFO] Invio delle modifiche al repository remoto...

git push >> GIT_LOG.txt 2>&1
git push

ECHO ================================================== >> GIT_LOG.txt
ECHO ==================================================

@REM Pausa di 3 secondi per il controllo finale
TIMEOUT /T 3 /NOBREAK > NUL

ECHO [INFO] Operazione completata con successo! >> GIT_LOG.txt
ECHO [INFO] Operazione completata con successo!
ECHO ================================================== >> GIT_LOG.txt
ECHO ==================================================

EXIT
