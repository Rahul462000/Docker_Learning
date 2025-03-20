# 1️⃣ First stage: Build the application
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install --only=production 

# Copy the rest of the application files
COPY . .

# 2️⃣ Second stage: Run the application with a Distroless image
FROM gcr.io/distroless/nodejs18-debian12

# Set working directory
WORKDIR /multiStage

# Copy only the necessary built files from the builder stage
COPY --from=builder /app /multiStage

ENV port=8080
# Expose the application port
EXPOSE  8080

# Command to run the app
CMD ["Index.js"]
