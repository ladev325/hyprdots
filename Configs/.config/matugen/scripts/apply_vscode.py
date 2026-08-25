#!/usr/bin/env python3
import json
import shutil
import re
from pathlib import Path

JSON_PATH = Path.home() / ".config/Code/User/matugen.json"
TARGET_SETTINGS = Path.home() / ".config/Code/User/settings.json"
BACKUP_SETTINGS = Path.home() / ".config/Code/User/settings-backup.json"

if not BACKUP_SETTINGS.exists():
    shutil.copy(TARGET_SETTINGS, BACKUP_SETTINGS)

with open(JSON_PATH, 'r') as f:
    content = f.read()
    content = re.sub(r'//.*?\n', '\n', content)
    content = '{' + content + '}'
    pywal_data = json.loads(content)

with open(TARGET_SETTINGS, 'r') as f:
    settings = json.load(f)

settings["workbench.colorCustomizations"] = pywal_data["workbench.colorCustomizations"]

with open(TARGET_SETTINGS, 'w') as f:
    json.dump(settings, f, indent=2)