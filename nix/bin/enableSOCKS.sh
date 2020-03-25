#!/bin/bash

networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 9050
networksetup -setsocksfirewallproxy Ethernet 127.0.0.1 9050
networksetup -setsocksfirewallproxystate Wi-Fi on
networksetup -setsocksfirewallproxystate Ethernet on
