@echo off
:: Creado por: Rodrigo Albuquerque
::Script Batch para Packetriot
mode con: cols=111 lines=30
title Packetriot.com
color 1f

echo.
echo                  				 +---------+
echo                  				 ! Pktriot !                             
echo                  				 +---------+            
echo  				+--------------------+-----------------------+
echo  				!    Protocolo       +        Porta          !
echo  				+--------------------+-----------------------+
::Protocolo/Porta
echo.
set /p " proto=-Digite o protocolo> "
set /p " porta=-Digite a porta> "
cls
::Condição
if EXIST pktriot.exe (goto inicio)else (
echo.
echo Arquivo pktriot.exe ausente! 
echo.
echo Aperte qualquer tecla para sair...
pause >nul
exit
)
:inicio 
echo.
echo                  				+---------+
echo                  				! Pktriot !
echo                  				+---------+
echo  				+--------------------+------------------+
echo  				! 1 Configure server ! 2 Iniciar server !
echo  				+--------------------+------------------+
echo  				! 3 Deletar config   ! 4 Sair	        !
echo  				+--------------------+------------------+
echo.
choice /c "1234" /n /m "-Digite> "
goto %errorlevel%
:1
pktriot.exe configure
:2
pktriot.exe %proto% %porta%
:3
rmdir /s %userprofile%\.pktriot
:4
exit
pause>nul
