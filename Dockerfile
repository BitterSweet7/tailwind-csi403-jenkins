# Step 1: Use an official Node.js image to build the Tailwind CSS first
FROM node:16-alpine AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json first to install dependencies
COPY package.json package-lock.json ./

# Install dependencies (including tailwindcss)
RUN npm install

# Copy the rest of the source files to the container
COPY . .

# Build the Tailwind CSS
RUN npm run build

# Step 2: Use an official Nginx image to serve static files
FROM nginx:alpine

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Copy the built files (including final CSS) from the build container
COPY --from=build /app/css /usr/share/nginx/html/css
COPY --from=build /app/index.html /usr/share/nginx/html/index.html
COPY --from=build /app/js /usr/share/nginx/html/js
COPY --from=build /app/img /usr/share/nginx/html/img

# Expose port 80 (Nginx default port)
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
