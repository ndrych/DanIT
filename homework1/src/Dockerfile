ARG NODE_VERSION
FROM node:${NODE_VERSION}

# Set the working directory in the container
WORKDIR /homework1

# Copy package.json and package-lock.json
COPY package*.json ./

# Copy package.json and package-lock.json to the working directory
COPY . .

# Install Node.js dependencies
RUN npm install

# Set the default port using build argument
ARG PORT=3000
ENV PORT=${PORT}

# Expose the port
EXPOSE ${PORT}

# Add label to the image
LABEL app="nodejs-app" version=${NODE_VERSION}

# Create a non-root user for the app
RUN addgroup --system app && adduser --system --ingroup app app

# Change the ownership of the application directory to the non-root user
RUN chown -R app:app /homework1

# Switch to the non-root user
USER app

# Command to run the Node.js application
CMD ["node", "app.js"]


