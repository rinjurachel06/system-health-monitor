# System Health Monitoring Script

This Bash script monitors the health of a Linux system by checking CPU usage, memory usage, disk space, and the number of running processes. It alerts the user if any of these metrics exceed predefined thresholds.

## Features

- **CPU Usage Monitoring**: Checks CPU usage and alerts if it exceeds a specified threshold.
- **Memory Usage Monitoring**: Monitors memory usage and alerts if it exceeds a specified threshold.
- **Disk Space Monitoring**: Checks disk space usage on the root filesystem and alerts if it exceeds a specified threshold.
- **Process Count Monitoring**: Counts the number of running processes and alerts if it exceeds a specified threshold.

## Requirements

- Linux-based operating system.
- Bash shell (`/bin/bash`).

## Usage

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/rinjurachel06/qa-test-2.git
   cd system-health-monitor
   ```

2. **Make the Script Executable**:

   ```bash
   chmod +x monitor_health.sh
   ```

3. **Run the Script**:

   ```bash
   ./monitor_health.sh
   ```

4. **Output**:

   The script will output alerts to the console if any of the thresholds are exceeded.

## Configuration

- **Thresholds**: Edit the script (`monitor_health.sh`) to adjust the predefined thresholds for CPU usage, memory usage, disk space, and number of processes as per your system's requirements.

## Example Output

```
Monitoring system health...
High CPU usage detected: 85%
High memory usage detected: 90%
High disk usage detected: 82%
High number of processes detected: 110
Health check completed.
```

