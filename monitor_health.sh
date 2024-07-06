#!/bin/bash

# Define thresholds
CPU_THRESHOLD=80    # CPU usage threshold (%)
MEM_THRESHOLD=80    # Memory usage threshold (%)
DISK_THRESHOLD=80   # Disk usage threshold (%)
PROCESS_THRESHOLD=100 # Number of processes threshold (adjust as needed)

# Function to check CPU usage
check_cpu() {
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
        echo "High CPU usage detected: $cpu_usage%" >&2
    fi
}

# Function to check memory usage
check_memory() {
    local mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100}')
    if (( $(echo "$mem_usage > $MEM_THRESHOLD" | bc -l) )); then
        echo "High memory usage detected: $mem_usage%" >&2
    fi
}

# Function to check disk usage
check_disk() {
    local disk_usage=$(df --output=pcent / | sed '1d;s/%//g')
    if (( $(echo "$disk_usage > $DISK_THRESHOLD" | bc -l) )); then
        echo "High disk usage detected: $disk_usage%" >&2
    fi
}

# Function to check number of processes
check_processes() {
    local process_count=$(ps aux | wc -l)
    if (( process_count > PROCESS_THRESHOLD )); then
        echo "High number of processes detected: $process_count" >&2
    fi
}

# Main function to run checks
main() {
    echo "Monitoring system health..."

    check_cpu
    check_memory
    check_disk
    check_processes

    echo "Health check completed."
}

# Run the main function
main
