apiVersion: apps/v1
kind: Deployment
metadata:
  name: python-app
  labels:
    app: python-app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: python-app
  template:
    metadata:
      labels:
        app: python-app
    spec:
      containers:
      - name: python-app
        image: CI_IMAGE:TAG
        ports:
        - containerPort: 8080
---
kind: Service
apiVersion: v1
metadata:
  name: python-app
spec:
  selector:
    app: python-app
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080
  type: NodePort
