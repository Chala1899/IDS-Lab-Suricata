# 🛡️ IDS Lab with Suricata

This project showcases a fully automated Intrusion Detection System (IDS) lab using Suricata. It simulates malicious traffic, captures alerts, and organizes logs for analysis and visualization.

## 📦 Included Files

- `iniciar_lab.sh`: Main Bash script to automate traffic simulation and log capture.
- `reporte_alertas.sh`: Script to generate a summary report from Suricata alerts.
- `eve.json`: Suricata's detailed alert log in JSON format.
- `dump.pcap`: Raw packet capture from tcpdump.

## ⚙️ Lab Workflow

1. **Environment Setup**  
   - Suricata, Apache2, Tcpdump, and Nmap installed on a Linux VM.
   - Network interface configured (e.g., `enp0s8`).

2. **Automation**  
   - `iniciar_lab.sh` starts Suricata, simulates traffic with Nmap, and captures packets with tcpdump.
   - Logs are organized by timestamp in structured folders.

3. **Analysis**  
   - Alerts are stored in `eve.json` and `fast.log`.
   - `reporte_alertas.sh` parses `eve.json` and generates a readable `.txt` summary.

4. **Visualization (Optional)**  
   - Logs can be visualized using EveBox or integrated into ELK Stack.

5. **Documentation & Publishing**  
   - All scripts and logs are version-controlled and published on GitHub.
   - README available in English for international visibility.

## 👩‍💻 Author

**Chalia Frómeta Castro**  
Cybersecurity Engineer | IDS/IPS Specialist | Linux Automation | Vulnerability Analysis  
Location: La Habana, Cuba  
GitHub: [github.com/your-Chala1899](https://github.com/Chala1899
