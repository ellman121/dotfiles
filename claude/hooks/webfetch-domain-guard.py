#!/usr/bin/env python3
"""PreToolUse hook for WebFetch: forces a permission prompt for any URL whose
host isn't in `sandbox.network.allowedDomains` in ~/.claude/settings.json, so
WebFetch and sandboxed Bash share one allowlist.

Listed hosts pass through untouched (the normal permission rules then apply).
Unlisted hosts, unparseable input or an unreadable settings file all return
an "ask" decision: fail closed to a prompt, never to a silent allow.

Matching follows the sandbox's rules: `example.com` matches only that host,
`*.example.com` matches any subdomain (not the apex), `*` matches everything.
"""

import json
import sys
from pathlib import Path
from urllib.parse import urlsplit

SETTINGS_PATH = Path.home() / ".claude" / "settings.json"


def ask(reason: str) -> None:
    print(
        json.dumps(
            {
                "hookSpecificOutput": {
                    "hookEventName": "PreToolUse",
                    "permissionDecision": "ask",
                    "permissionDecisionReason": reason,
                }
            }
        )
    )
    sys.exit(0)


def normalize(host: str) -> str:
    return host.lower().rstrip(".")


def host_matches(host: str, pattern: str) -> bool:
    pattern = normalize(pattern)
    if pattern == "*":
        return True
    if pattern.startswith("*."):
        return host.endswith(pattern[1:])
    return host == pattern


def main() -> None:
    try:
        payload = json.load(sys.stdin)
        url = payload["tool_input"]["url"]
        host = normalize(urlsplit(url).hostname or "")
    except Exception:
        ask("WebFetch domain guard: couldn't read the URL from the tool call")
        return
    if not host:
        ask(f"WebFetch domain guard: no host in {url!r}")

    try:
        settings = json.loads(SETTINGS_PATH.read_text())
        allowed = settings["sandbox"]["network"]["allowedDomains"]
    except Exception:
        ask(f"WebFetch domain guard: couldn't read allowedDomains from {SETTINGS_PATH}")
        return

    if any(host_matches(host, pattern) for pattern in allowed):
        sys.exit(0)

    ask(f"WebFetch domain guard: {host} isn't in sandbox.network.allowedDomains")


if __name__ == "__main__":
    main()
