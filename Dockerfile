# FROM node:14
# WORKDIR /usr/src/app
# COPY package*.json ./
# RUN npm install
# COPY . .
# EXPOSE 5000
# ENTRYPOINT ["npm"]
# CMD ["start"]

                                    # Stage 1: Build Stage
FROM node:14 AS build

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

                                    # Stage 2: Production Stage
FROM node:14-alpine AS production

# Set the working directory
WORKDIR /usr/src/app

# Copy only the necessary files from the build stage
COPY --from=build /usr/src/app ./

# Expose the application port
EXPOSE 5000

# Set the entry point and default command
ENTRYPOINT ["npm"]
CMD ["start"]
