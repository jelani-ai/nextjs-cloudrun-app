# base image
FROM node:18.19.1-slim

# Create and change the app directory.
WORKDIR /usr/app

# Copy application dependency manifests to the container image
# A swildcard is used to ensure copying both package.json AND package-lock.json (when available)
# Copying this first prevents re-reunning npm install on every code change
COPY . .

# Install production dependencies
# If you add a package-lock.json, speed your build by switching to 'num ci'
RUN npm ci --only=production

RUN npm run build

CMD [ "npm", "start" ]