@REM ===================================================================
@REM Script per la gestione del repository Git
@REM ===================================================================

@ECHO OFF  @REM Disabilita la visualizzazione dei comandi nella shell

@REM Spostarsi nella directory del repository
CD /D c:\CASA\GE_MARINO\BANCA\Notiziario\

@REM Creare o svuotare il file di log
ECHO. > GIT_LOG.txt
ECHO [LOG] Inizio esecuzione script >> GIT_LOG.txt
ECHO. >> GIT_LOG.txt

@REM Mostrare il contenuto della directory per verifica
DIR >> GIT_LOG.txt 2>&1
ECHO. >> GIT_LOG.txt

@REM ===================================================================
@REM 01 - GIT STATUS: Controllo dello stato del repository
@REM ===================================================================
ECHO [INFO] Controllo dello stato del repository... >> GIT_LOG.txt
git status >> GIT_LOG.txt 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO [ERRORE] git status ha fallito! >> GIT_LOG.txt
ECHO. >> GIT_LOG.txt

@REM Pausa di 3 secondi per il controllo
TIMEOUT /T 3 /NOBREAK > NUL

@REM ===================================================================
@REM 02 - GIT PULL: Scaricare gli aggiornamenti dal repository remoto
@REM ===================================================================
ECHO [INFO] Scarico aggiornamenti dal web... >> GIT_LOG.txt
git pull >> GIT_LOG.txt 2>&1
IF %ERRORLEVEL% NEQ 0 ECHO [ERRORE] git pull ha fallito! >> GIT_LOG.txt
ECHO. >> GIT_LOG.txt

@REM Pausa di 5 secondi per il controllo
TIMEOUT /T 5 /NOBREAK > NUL

@REM ===================================================================
@REM 03 - GIT COMMIT: Aggiunta e commit delle modifiche
@REM ===================================================================

ECHO [INFO] Aggiunta e commit delle modifiche... >> GIT_LOG.txt
git add . >> GIT_LOG.txt 2>&1

IF %ERRORLEVEL% NEQ 0 ECHO [ERRORE] git add ha fallito! >> GIT_LOG.txt

git commit -m "aggiornamento Notiziario Economico" >> GIT_LOG.txt 2>&1

IF %ERRORLEVEL% NEQ 0 ECHO [ERRORE] git commit ha fallito! >> GIT_LOG.txt
ECHO. >> GIT_LOG.txt

@REM Pausa di 10 secondi per garantire il commit
TIMEOUT /T 10 /NOBREAK > NUL

@REM ===================================================================
@REM 04 - GIT PUSH: Invio delle modifiche al repository remoto
@REM ===================================================================

ECHO [INFO] Invio delle modifiche al repository remoto... >> GIT_LOG.txt

git push >> GIT_LOG.txt 2>&1

IF %ERRORLEVEL% NEQ 0 ECHO [ERRORE] git push ha fallito! >> GIT_LOG.txt
ECHO. >> GIT_LOG.txt

@REM Pausa di 3 secondi per il controllo finale
TIMEOUT /T 3 /NOBREAK > NUL

ECHO [INFO] Operazione completata con successo! >> GIT_LOG.txt
ECHO. >> GIT_LOG.txt
EXIT
