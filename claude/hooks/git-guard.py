#!/usr/bin/env python3
"""PreToolUse hook for Bash: only `git diff`, `git log`, and `git status` may run.

A guardrail, not a security boundary: eval or constructed strings can evade it.
Fails closed when a git subcommand can't be determined.
"""
import json
import re
import shlex
import sys

ALLOWED = {"diff", "status", "log", "show"}

# A standalone `git` word, or a path to the binary (.../bin/git). Ignores .git,
# .gitignore, github, git-lfs, and directories named git such as ~/.config/git.
GIT_WORD = re.compile(r"(?<![\w.\-/])(?:[^\s;&|()`\"']*/bin/)?git(?![\w.\-/])")
# Global options that take a separate value argument.
OPTS_WITH_VALUE = {"-C", "-c", "--git-dir", "--work-tree", "--namespace", "--exec-path", "--super-prefix", "--config-env"}
SEPARATORS = {";", "&&", "||", "|", "&", "(", ")", "{", "}"}


def subcommand_after(rest):
    try:
        lexer = shlex.shlex(rest, posix=True, punctuation_chars=True)
        lexer.whitespace_split = True
        tokens = list(lexer)
    except ValueError:
        return None
    i = 0
    while i < len(tokens):
        tok = tokens[i]
        if tok in SEPARATORS or re.fullmatch(r"[;&|()]+", tok):
            return None
        if tok in OPTS_WITH_VALUE:
            i += 2
        elif tok.startswith("-"):
            i += 1
        else:
            return tok
    return None


def main():
    command = json.load(sys.stdin).get("tool_input", {}).get("command", "")
    for match in GIT_WORD.finditer(command):
        sub = subcommand_after(command[match.end():])
        if sub not in ALLOWED:
            print(
                f"Blocked: git {sub or '<unknown>'} is not allowed. Only `git diff`,"
                "`git log`, and `git status` may run; the user runs all other git"
                "commands themselves.",
                file=sys.stderr,
            )
            sys.exit(2)


if __name__ == "__main__":
    main()
