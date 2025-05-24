#### 端口映射到本地
# redis
kubectl port-forward -n social svc/home-timeline-redis 6379:6379
redis-cli -h 127.0.0.1 -p 6379

# mongodb
kubectl port-forward -n social svc/user-mongodb 27017:27017
mongo --host 127.0.0.1 --port 27017

# memcached
kubectl port-forward -n social svc/media-memcached 11211:11211
telnet 127.0.0.1 11211


#### 或者进入 pod 操作
kubectl exec -it -n social media-memcached-987dff5-9s8b6 -- sh


# connect service
kubectl port-forward -n social svc/nginx-thrift 8080:8080
kubectl port-forward -n social svc/media-frontend 8081:8081
kubectl port-forward -n social svc/jaeger 16686:16686