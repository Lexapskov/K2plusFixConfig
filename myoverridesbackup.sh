#!/bin/ash
export PATH=/opt/bin:$PATH
cd /mnt/UDISK/printer_data/config

# Проверяем, есть ли изменения
git add overrides.cfg printer.cfg gcode_macro.cfg box.cfg myoverridesbackup.sh README.md StartGcode.txt

if git diff --cached --quiet; then
    echo "No changes to commit"
    exit 0
fi

# Выполняем коммит и пуш
if git commit -m "Config backup: $(date '+%Y-%m-%d %H:%M:%S')" && git push -f origin main; then
    echo "success"
    exit 0
else
    echo "failure"
    exit 1
fi