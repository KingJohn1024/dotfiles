#!/usr/bin/env python3
import sys, json, re

data = json.load(sys.stdin)
cmd = data.get("tool_input", {}).get("command", "")

if re.search(r"\brm\b|\bunlink\b|\brmdir\b|\bshred\b", cmd):
    print("BLOCKED: File deletion is not permitted (rm/unlink/rmdir/shred). No-delete policy is enforced.")
    sys.exit(2)
