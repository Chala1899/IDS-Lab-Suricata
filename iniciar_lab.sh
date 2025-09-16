#!/bin/bash

# Activar modo estricto: detener si hay errores
set -e

# Establecer fecha para organizar logs
FECHA=$(date "+%Y-%m-%d_%H-%M")
LOG_DIR="$HOME/suricata_logs/$FECHA"

# Crear carpeta para esta sesión
mkdir -p "$LOG_DIR"

# Verificar si Apache está instalado
if command -v apache2 >/dev/null 2>&1; then
    echo "[*] Apache está instalado."
    sudo apachectl configtest
    sudo systemctl restart apache2 || echo "[!] Apache no pudo reiniciarse. Verifica configuración."
else
    echo "[!] Apache no está instalado. Saltando reinicio..."
fi

# Verificar si Suricata está instalado
if command -v suricata >/dev/null 2>&1; then
    echo "[*] Suricata está instalado."
    echo "[*] Iniciando Suricata en modo escucha..."
    sudo suricata -c /etc/suricata/suricata.yaml -i enp0s8 -l "$LOG_DIR" &
else
    echo "[!] Suricata no está instalado. Abortando..."
    exit 1
fi

# Verificar si tcpdump está instalado
if command -v tcpdump >/dev/null 2>&1; then
    echo "[*] Tcpdump está instalado."
    echo "[*] Iniciando tcpdump en modo escucha..."
    sudo tcpdump -i enp0s8 -w "$LOG_DIR/dump.pcap" &
else
    echo "[!] Tcpdump no está instalado. Saltando captura adicional..."
fi

# Verificar si Nmap está instalado
if command -v nmap >/dev/null 2>&1; then
    echo "[*] Nmap está instalado."
    echo "[*] Simulando escaneo con Nmap..."
    nmap -sS -T4 localhost
else
    echo "[!] Nmap no está instalado. Saltando simulación de tráfico..."
fi

# Esperar para capturar tráfico
sleep 10

# Detener Suricata
echo "[*] Deteniendo Suricata..."
sudo pkill suricata

echo "[✓] Sesión completada. Logs guardados en: $LOG_DIR"
