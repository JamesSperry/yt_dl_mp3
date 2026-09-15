@cls
@title Youtube Download to MP3
@echo off
setlocal EnableExtensions DisableDelayedExpansion

:start
@ECHO OFF
ECHO ======================================================================================================================
ECHO.
SET /P URL="[Enter video URL] "
ECHO.

IF "%URL%"=="" (
    ECHO No URL given, exiting.
    ping 127.0.0.1 -n 2 -w 1000 > NUL
    EXIT
) ELSE (
    ECHO ======================================================================================================================
	ECHO.
	yt-dlp -x --audio-format mp3 -o "%%(title)s.%%(ext)s" -i --ignore-config "%URL%"
	ECHO.
	ECHO ======================================================================================================================
	ECHO.
	move *.mp3 download
	ECHO Done!
	SET URL=
	goto start
)

EXIT
