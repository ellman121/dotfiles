#!/bin/bash

networksetup -setsocksfirewallproxystate Wi-Fi off
networksetup -setsocksfirewallproxystate Ethernet off
echo "SOCKS proxy disabled."
