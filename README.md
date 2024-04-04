# FIX YOUR MP4 FILE FOR FREE WITH OPENSOURCE TOOLS ON WINDOWS

## What it is?

This is a fork of https://github.com/bookkojot/mp4fixer with added tools for running it under Windows.

aacfixer
- dynamically linked binary for Linux x64 and amrhf 32bit
- requires libraries (libfaad.so.2.0.0, libfaad_drm.so.2.0.0) (https://packages.debian.org/bullseye/amd64/libfaad2/filelist)
- yes the original segfault is included

aacfixer_static
- static Linux x64 and armhf 32bit binary version using https://github.com/sigurd-dev/mkblob/raw/master/binary_x86_64/mkblob

aacrepair_cmd.exe
- python CLI for library aacrepair (https://github.com/44xtc44/aacRepair)
- replaced interactive part of the CLI with argv1
- converted to binary using pyinstaller (see build_aacrepair_cmd.cmd)
- does not do as good job as the aacfixer

fixer.exe
- converted fixer.pl using ActivePerl for Windows 5.28
- $ pp -x -v

fixer.cmd
- wrapper for fixer.exe
- assumes two arguments BADFILE and KNOWNOKFILE
