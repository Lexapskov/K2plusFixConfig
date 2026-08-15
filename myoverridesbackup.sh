#!/bin/ash
export PATH=/opt/bin:$PATH
cd /mnt/UDISK/printer_data/config
git add overrides.cfg printer.cfg gcode_macro.cfg box.cfg myoverridesbackup.sh README.md StartGcode.txt
if git diff --cached --quiet; then
    echo "No changes to commit"
    exit 0
fi
git commit -m "Config backup: $(date '+%Y-%m-%d %H:%M:%S')"
git push -f origin main
