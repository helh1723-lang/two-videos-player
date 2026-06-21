import path from 'node:path';
import { fileURLToPath } from 'node:url';
import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

export default defineConfig(({ command, isPreview }) => ({
  server: {
    port: 3000,
    host: '127.0.0.1',
  },
  optimizeDeps: command === 'serve' && !isPreview ? {
    disabled: true,
  } : undefined,
  plugins: [react()],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, '.'),
    },
  },
}));
