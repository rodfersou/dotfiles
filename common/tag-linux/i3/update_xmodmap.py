#!/usr/bin/env python3

import subprocess
import time
import shlex
import pathlib

def run_cmd(cmd):
    """Run a shell command and return its stdout."""
    return subprocess.run(shlex.split(cmd), capture_output=True, text=True).stdout

def get_mac_from_line(line):
    """Extract the MAC address from a line."""
    tokens = line.split()
    for token in tokens:
        if ':' in token and len(token.split(':')) == 6:
            return token
    return None

def is_keyboard(mac):
    """Check if the device info mentions a keyboard."""
    info = run_cmd(f"bluetoothctl info {mac}")
    return "keyboard" in info.lower()

def main():
    process = subprocess.Popen(
        ["bluetoothctl"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        bufsize=1
    )

    print("Listening for Bluetooth connections...")

    try:
        for line in process.stdout or []:
            mac = None
            if "Connected: yes" in line:
                mac = get_mac_from_line(line)
            if mac and is_keyboard(mac):
                print(f"Keyboard connected: {mac}")
                time.sleep(0.3)
                subprocess.run(["setxkbmap", "'us(altgr-intl)'"])
                subprocess.run(["xmodmap", f"{pathlib.Path.home()}/.Xmodmap.d/us_swap_keys"])
                print("xmodmap applied.")
    except KeyboardInterrupt:
        print("\nStopped.")
    finally:
        process.terminate()

if __name__ == "__main__":
    main()
