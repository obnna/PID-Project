# Linux PID Lookup Script  
A simple Linux utility that retrieves the command name associated with a given process ID (PID).  
This project demonstrates basic process inspection, shell scripting, and operational troubleshooting skills.

---

## 📌 Overview  
This script accepts a PID as an argument and prints the command name for that process by reading from `/proc/<PID>/comm`.  
It’s a lightweight example of how Linux exposes process metadata and how support engineers can quickly inspect system state.

---

## 🧠 Why This Project Exists  
Support and reliability engineers frequently need to identify which process is tied to a PID during incident response or debugging.  
This script replicates a common real‑world task:

- verifying which service is running  
- checking for orphaned processes  
- validating deployments  
- investigating resource spikes  

---

## 🚀 How to Run (Linux Only)

```bash
chmod +x pid.sh
./pid.sh <PID>

