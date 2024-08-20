#!/bin/sh

[ -f "/var/cache/llamafile/llamafile" ] || wget -O /var/cache/llamafile/llamafile https://github.com/Mozilla-Ocho/llamafile/releases/download/0.8.13/llamafile-0.8.13
chmod +x /var/cache/llamafile/llamafile
