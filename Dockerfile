# Step 1: Use an official Node.js image as the base
FROM node:16-alpine

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the package.json and package-lock.json (if available)
COPY package*.json ./

# Step 4: Install dependencies (including Tailwind CSS)
RUN npm install

# Step 5: Copy the rest of your application code
COPY . .

# Step 6: Run the build command
RUN npm run build

# Step 7: Expose the port that your application will run on (if applicable)
EXPOSE 3000 

# Step 8: Specify the command to run when the container starts
CMD ["npm", "run", "watch"]  # or "npm run dev" if you're starting a dev server
