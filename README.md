![Actions Status](https://github.com/machine-learning-apps/gke-argo/workflows/Integration%20Test/badge.svg)

## This Action Submits Workflows To [Argo](https://argoproj.github.io/) Running on [GKE](https://cloud.google.com/kubernetes-engine/)

The purpose of this action is to allow automatic testing of [Argo Workflows](https://argoproj.github.io/argo) from GitHub for Kubernetes cluster running on GCP.  

This action is a mechanism you can leverage to accomplish [CI/CD of Machine Learning](https://blog.paperspace.com/ci-cd-for-machine-learning-ai/).   This Action facilitates instantiating model training runs on the compute of your choice running on K8s, specifically on [Google Kubernetes Engine](https://cloud.google.com/kubernetes-engine/).  

What are Argo Workflows?  

From [the docs](https://argoproj.github.io/docs/argo/readme.html):

- Argo Workflows is an open source container-native workflow engine for orchestrating parallel jobs on Kubernetes. Argo Workflows is implemented as a Kubernetes CRD (Custom Resource Definition).

- Define workflows where each step in the workflow is a container.
Model multi-step workflows as a sequence of tasks or capture the dependencies between tasks using a graph (DAG).
- Easily run compute intensive jobs for machine learning or data processing in a fraction of the time using Argo Workflows on Kubernetes.
- Run CI/CD pipelines natively on Kubernetes without configuring complex software development products.
