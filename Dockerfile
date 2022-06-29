FROM node:alpine

LABEL com.github.actions.name="GitHub Slack Workflow Notifications" \
      com.github.actions.description="Fully detailed GitHub Actions workflow notifications in Slack" \
      com.github.actions.icon="message-green" \
      com.github.actions.color="green" \
      maintainer="Ahmad Nassri <ahmad@ahmadnassri.com>"

RUN mkdir /action
WORKDIR /action

COPY action/package*.json ./

RUN npm ci --only=prod
COPY action ./


ENTRYPOINT ["node", "/action/index.js"]
