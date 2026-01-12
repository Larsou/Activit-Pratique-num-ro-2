#!/bin/bash

# Script to start all microservices in the correct order
# Make sure you're in the project root directory

echo "🚀 Starting Microservices in Order..."
echo ""

# 1. Start Config Service
echo "1️⃣  Starting Config Service (port 9999)..."
cd config-service
mvn spring-boot:run > ../logs/config-service.log 2>&1 &
CONFIG_PID=$!
cd ..
sleep 10  # Wait for config service to be ready
echo "   ✓ Config Service started (PID: $CONFIG_PID)"

# 2. Start Discovery Service
echo "2️⃣  Starting Discovery Service (port 8761)..."
cd discovery-service
mvn spring-boot:run > ../logs/discovery-service.log 2>&1 &
DISCOVERY_PID=$!
cd ..
sleep 10  # Wait for discovery service to be ready
echo "   ✓ Discovery Service started (PID: $DISCOVERY_PID)"

# 3. Start Gateway Service
echo "3️⃣  Starting Gateway Service (port 8888)..."
cd gateway-service
mvn spring-boot:run > ../logs/gateway-service.log 2>&1 &
GATEWAY_PID=$!
cd ..
sleep 10  # Wait for gateway service to be ready
echo "   ✓ Gateway Service started (PID: $GATEWAY_PID)"

# 4. Start Customer Service
echo "4️⃣  Starting Customer Service (port 8081)..."
cd customer-service
mvn spring-boot:run > ../logs/customer-service.log 2>&1 &
CUSTOMER_PID=$!
cd ..
sleep 10  # Wait for customer service to be ready
echo "   ✓ Customer Service started (PID: $CUSTOMER_PID)"

# 5. Start Inventory Service
echo "5️⃣  Starting Inventory Service (port 8082)..."
cd inventory-service
mvn spring-boot:run > ../logs/inventory-service.log 2>&1 &
INVENTORY_PID=$!
cd ..
sleep 10  # Wait for inventory service to be ready
echo "   ✓ Inventory Service started (PID: $INVENTORY_PID)"

# 6. Start Billing Service
echo "6️⃣  Starting Billing Service (port 8083)..."
cd billing-service
mvn spring-boot:run > ../logs/billing-service.log 2>&1 &
BILLING_PID=$!
cd ..
sleep 10  # Wait for billing service to be ready
echo "   ✓ Billing Service started (PID: $BILLING_PID)"

echo ""
echo "✅ All services started!"
echo ""
echo "Service PIDs:"
echo "  Config Service:    $CONFIG_PID"
echo "  Discovery Service: $DISCOVERY_PID"
echo "  Gateway Service:   $GATEWAY_PID"
echo "  Customer Service:  $CUSTOMER_PID"
echo "  Inventory Service: $INVENTORY_PID"
echo "  Billing Service:   $BILLING_PID"
echo ""
echo "📋 Service URLs:"
echo "  Config Service:    http://localhost:9999"
echo "  Discovery Service: http://localhost:8761"
echo "  Gateway Service:   http://localhost:8888"
echo "  Customer Service:  http://localhost:8081"
echo "  Inventory Service: http://localhost:8082"
echo "  Billing Service:   http://localhost:8083"
echo ""
echo "📝 Logs are available in the logs/ directory"
echo ""
echo "To stop all services, run: ./stop-services.sh"

# Save PIDs to file for stop script
mkdir -p logs
echo "$CONFIG_PID" > logs/config-service.pid
echo "$DISCOVERY_PID" > logs/discovery-service.pid
echo "$GATEWAY_PID" > logs/gateway-service.pid
echo "$CUSTOMER_PID" > logs/customer-service.pid
echo "$INVENTORY_PID" > logs/inventory-service.pid
echo "$BILLING_PID" > logs/billing-service.pid

