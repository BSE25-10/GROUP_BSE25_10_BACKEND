// src/metrics.ts
import client from 'prom-client';

// Create a metrics registry
export const register = new client.Registry();

// Collect default Node metrics (CPU, memory, event loop lag, etc.)
client.collectDefaultMetrics({ register });

// Custom metric — count all incoming HTTP requests
export const httpRequestCounter = new client.Counter({
  name: 'app_http_requests_total',
  help: 'Total number of HTTP requests',
  labelNames: ['method', 'route', 'status_code'],
  registers: [register],
});
