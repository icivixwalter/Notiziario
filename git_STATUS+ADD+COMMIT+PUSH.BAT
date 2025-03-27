@REM  cd.. devi posizionarti su git_desktop
CD c:\CASA\GE_MARINO\BANCA\Notiziario\
dir 

@ECHO 01_GIT_STATUS =   faccio un controllo con status, poi aggiungi con add tutto l'albero + il comimit e il push
git status

ECHO pausa di 3 secondi per il controllo
@TIMEOUT /T 3 /NOBREAK

ECHO 02_GIT_PULL = prima scarico aggiornamenti dal web con 5 secondi per il controllo
git pull
@TIMEOUT /T 5 /NOBREAK


ECHO 03_GIT_COMMIT =  eseguo il commit 
git add .
git commit -m "aggiornamento Notiziario Economico"

@rem pausa di 20 secondi per consentire il commit

@REM 01)
@REM sospensione per 1 secondo con crononometro 
@REM ---->	timeout /t 2 /nobreak > NUL
@REM ---->
ECHO
ECHO
ECHO  pausa di 10 secondi per consentire il commit
ECHO
@TIMEOUT /T 10 /NOBREAK

ECHO 04_GIT_PUSH =  eseguo il IL PUSH SUL WEB 
git push


ECHO pausa di 3 secondi per il controllo
@TIMEOUT /T 3 /NOBREAK
