#!/bin/bash

# Script to stop all microservices

echo "🛑 Stopping all microservices..."
echo ""

if [ -d "logs" ]; then
    for pid_file in logs/*.pid; do
        if [ -f "$pid_file" ]; then
            PID=$(cat "$pid_file")
            SERVICE_NAME=$(basename "$pid_file" .pid)
            if ps -p $PID > /dev/null 2>&1; then
                echo "Stopping $SERVICE_NAME (PID: $PID)..."
                kill $PID
            else
                echo "$SERVICE_NAME (PID: $PID) is not running"
            fi
        fi
    done
    
    # Also kill any remaining Java processes (Spring Boot apps)
    echo ""
    echo "Cleaning up any remaining Java processes..."
    pkill -f "spring-boot:run" 2>/dev/null
    
    echo ""
    echo "✅ All services stopped!"
else
    echo "No logs directory found. Trying to kill all Spring Boot processes..."
    pkill -f "spring-boot:run"
    echo "✅ Done!"
fi

