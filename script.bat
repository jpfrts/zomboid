@echo off
color 0A
chcp 65001
cls

set repo_directory=%USERPROFILE%\Zomboid\mods
set repo_url=https://github.com/jpfrts/zomboid.git
set git_installer_path=%CD%/bin/git.exe

echo:Atualizador de mods para Project Zomboid
echo:                 
echo:______________________________________________________________
echo:
echo:Verificando as dependências...

git --version > nul 2>&1
if %errorlevel% neq 0 (
    echo:Git não encontrado. Iniciando instalação...
    "%git_installer_path%" /SILENT /NORESTART
    echo:Git instalado!
    echo:Por favor, reinicie o programa.
    pause
    exit

)
echo:Git encontado.

if exist "%repo_directory%" (
    echo:Arquivos encontrados! 
    echo:
    echo:Procurando por atualizações...
    cd "%repo_directory%"

    git fetch 
    if %errorlevel% neq 0 (
        echo:ERRO: git fetch 
        pause
        exit
    )

    git pull > output.txt 2>&1
    set /p output=<output.txt
    echo %output% | findstr /C:"Already up to date." > nul
    if %errorlevel% equ 0 (
        @REM for /f "delims=" %%a in ('git show -s --format="%cd" --date=format:"%d/%m/%Y %H:%M:%S"') do set "commit_date=%%a"
        @REM echo:Os mods já estão atualizados. Última atualização: %commit_date%

        echo:Os arquivos já estão atualizados.
    )
) else (
    echo:Arquivos do servidor não encontrados.
    echo:Baixando...   
    echo: 
    git clone %repo_url% %repo_directory%
)
echo:
echo:Arquivos atualizados com sucesso!
pause
cls 

echo:Conecte-se com o IP br1.jpfreitas.com
echo: 

pause
cls
exit

