# Use Node 20 Alpine image
FROM node:20-alpine

# Install PNPM globally
RUN npm install -g pnpm

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Copy the rest of the source code
COPY . .

# Generate Prisma client
RUN pnpm exec prisma generate

# Set production environment
ENV NODE_ENV=production

# Expose the port your app runs on
EXPOSE 8000

# Run Prisma migrations at runtime and start the app
CMD pnpm exec prisma migrate deploy && pnpm start
