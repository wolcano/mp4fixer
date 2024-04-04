@echo off

set BAD_FN=%1
set REF_FN=%2
set PFX_FN=%~dpn1_
set AAC_TMP_FN="%PFX_FN%-mix.aac"
set AAC_FN="%~dp1_aacrepair_%~n1_-mix.aac"

if x%REF_FN%x xEQU x (
	echo fixer.cmd BAD.mp4 REFERENCE.mp4
	pause
	exit /b
)

perl fixer.pl %REF_FN% %BAD_FN% "%PFX_FN%"

rem concat AAC headers and out-audio
type "%PFX_FN%-headers.aac">"%AAC_TMP_FN%"
type "%PFX_FN%-out-audio.raw">>"%AAC_TMP_FN%"
aacrepair_cmd.exe "%PFX_FN%-mix.aac"

ffmpeg -fflags +genpts -i "%PFX_FN%-out-video.h264" -i %AAC_FN% -vcodec copy -acodec copy "%PFX_FN%.mp4"


echo Deleting temp files

del "%PFX_FN%-headers.aac"
del "%PFX_FN%-headers.h264"
del "%PFX_FN%-nals.txt"
del "%PFX_FN%-nals-stat.txt"
del "%PFX_FN%-stat.mp4"

del "%PFX_FN%-out-audio.raw"
del "%PFX_FN%-out-video.h264"

del "%AAC_TMP_FN%"
del %AAC_FN%

pause
