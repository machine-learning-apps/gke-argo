FROM google/cloud-sdk

LABEL "com.github.actions.name"="Submit Argo Workflows to GKE"
LABEL "com.github.actions.description"="Trigger Argo (https://argoproj.github.io/) workflows That run on Google Kubernetes Engine (GKE) from GitHub"
LABEL "com.github.actions.icon"="upload-cloud"
LABEL "com.github.actions.color"="blue"
LABEL "repository"="https://github.com/machine-learning-apps/gke-argo"
LABEL "homepage"="http://github.com/actions"
LABEL "maintainer"="Hamel Husain <hamel.husain@gmail.com>"

RUN curl -sSL -o /usr/local/bin/argo https://github.com/argoproj/argo/releases/download/v2.2.1/argo-linux-amd64
RUN chmod +x /usr/local/bin/argo

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]