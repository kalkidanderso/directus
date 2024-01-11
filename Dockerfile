# Use the official Node.js image
FROM node:16.20.0

# Set the working directory
WORKDIR /home/kalkidan/one/18

# Copy package.json and yarn.lock to the working directory
COPY package*.json ./

# Install dependencies
RUN yarn install

# Copy the entire project to the working directory
COPY . .

# Copy the environment file
COPY .env .env

# Expose the port Directus will run on
EXPOSE 8055

# Define the command to run your application
CMD ["yarn", "start"]
