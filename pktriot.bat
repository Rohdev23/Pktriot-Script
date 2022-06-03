@echo off
::Criado por: Rodrigo Albuquerque
::Script Batch para Packetriot
mode con: cols=111 lines=30
title Packetriot.com
color 1f
:retorno
echo.
::condição 1
if Not exist pktriot.exe (
	echo pktriot.exe ausente, pressione qualquer tecla parar sair...
		pause >nul
			exit
)
echo.
echo                  				 +---------+
echo                  				 ! Pktriot !                             
echo                  				 +---------+            
echo  				+----------------------+--------------------+
echo  				! Protocolos HTTP/TCP  +      Porta         !
echo  				+----------------------+--------------------+
::Protocolo/Porta
echo.
set /p " proto=-Digite o protocolo> "
set /p " porta=-Digite a porta> "
cls
::Condição 2
if /i %proto% EQU tcp (
	goto inicio
)
if /i %proto% EQU http (
	goto inicio
)else (
echo.
 echo -Protocolo sem suporte, Tente novamente...
   pause >nul
    cls
     goto retorno
				
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