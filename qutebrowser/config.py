# On macOS, qutebrowser loads config.py from ~/.qutebrowser/config.py
# (NOT ~/.config/qutebrowser/config.py like on Linux).
# That path is a symlink to this file.
#
# Settings changed via :set or the GUI are stored in
# ~/Library/Preferences/qutebrowser/autoconfig.yml and loaded below.
config.load_autoconfig()
