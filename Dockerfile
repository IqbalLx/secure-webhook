FROM node:12.10.0-alpine

LABEL "version"="0.1.0"
LABEL "repository"="https://github.com/navied/secure-webhook"
LABEL "homepage"="https://github.com/navied/secure-webhook"
LABEL "maintainer"="@navied"
LABEL "com.github.actions.name"="Secure Webhook"
LABEL "com.github.actions.description"="Post data and an hmac signature to an endpoint"
LABEL "com.github.actions.icon"="message-square"
LABEL "com.github.actions.color"="gray-dark"

# Add the entry point
RUN mkdir /app
ADD main.js /app/main.js
ADD package.json /app/package.json
ADD entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

RUN cd /app
WORKDIR /app
RUN npm install

# Load the entry point
ENTRYPOINT ["/app/entrypoint.sh"]