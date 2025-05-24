helm install cluster . \
  --set global.mongodb.sharding.enabled=true \
  --set global.mongodb.standalone.enabled=false \
  --set global.redis.cluster.enabled=true \
  --set global.redis.standalone.enabled=false \
  --set global.memcached.cluster.enabled=true \
  --set global.memcached.standalone.enabled=false \
  --timeout 10m0s \
  -n social --create-namespace

helm install standalone .\
  --timeout 10m0s \
  -n social --create-namespace

kubectl get all -n social

helm uninstall cluster -n social

kubectl delete pod redis-cluster-readiness-hook -n social

helm history standalone -n social

helm upgrade standalone . -n social --description "解除所有资源的限制"