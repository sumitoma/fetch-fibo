# build docker images
docker build -t sumitoma/multi-client -f ./client/Dockerfile ./client
docker build -t sumitoma/multi-server -f ./server/Dockerfile ./client
docker build -t sumitoma/multi-worker -f ./worker/Dockerfile ./client

# push images to docker hub
docker push sumitoma/multi-client
docker push sumitoma/multi-server
docker push sumitoma/multi-worker

#take kubeconfig file and apply
kubectl apply -f k8s
#will not update the image with default(latest) tag if already deployed even with older version
kubectl set image deployments/server-deployment server=sumitoma/multi-server
