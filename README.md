# Kubernetes camera app

Python app to view the output of a camera feed in the browser. Has a Dockerfile and a Kubernetes DaemonSet definition to run in either Docker or Kubernetes.

# Run locally

```
# Clone the repo
python3 -m venv .venv                                                                                                     
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
VIDEO_INPUT=/dev/video0 PORT=5000 python app.py
```

# Run in Docker
```
docker build -t <tag>
docker run --privileged -p 5000:5000 -e VIDEO_INPUT=/app/dev/video0 -e PORT=5000 -v /dev/video0:/app/dev/video0 <tag>
```

# Run in Kubernetes
```
# Ensure you have a Kubernetes cluster, where each node has a camera feed from /dev/video0.
# Otherwise, you will need to edit this YAML file.
kubectl apply -f camera-app.yaml
```