#!/bin/bash

echo "=== SSH LOGIN LOGS TODAY ==="

echo ""

echo "[+] SUCCESSFULLY:"
journalctl -u ssh --since today | awk '/Accepted (password|publickey)/ {print $1, $2, $3, "— User:", $9, "— Login by:", $7, "— IP:", $11}'

echo ""

echo "[-] UNSUCCESSFUL:"
journalctl -u ssh --since today | awk '/Failed password/ {print $1, $2, $3, "— User:", $9,"— IP:", $11}'

echo ""

echo "Completed."

