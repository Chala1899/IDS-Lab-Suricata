#!/bin/bash

# Archivo de entrada
EVE_FILE="eve.json"
REPORTE="reporte_alertas.txt"

# Verificar si jq está instalado
if ! command -v jq &> /dev/null; then
    echo "[!] jq no está instalado. Instálalo con: sudo apt install jq"
    exit 1
fi

# Verificar si el archivo existe
if [ ! -f "$EVE_FILE" ]; then
    echo "[!] No se encontró el archivo $EVE_FILE"
    exit 1
fi

# Generar reporte
echo "Resumen de alertas - $(date)" > "$REPORTE"
echo "----------------------------------------" >> "$REPORTE"
jq -r '. | select(.event_type=="alert") | [.timestamp, .alert.signature, .src_ip, .dest_ip] | @tsv' "$EVE_FILE" >> "$REPORTE"

echo "[✓] Reporte generado: $REPORTE"
