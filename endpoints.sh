KONG_SOCKET=`minikube service --url kong-service -n interscity | head -n 1`
echo "Resource Cataloguer => $KONG_SOCKET/catalog"
echo "Resource Adaptor    => $KONG_SOCKET/adaptor"
echo "Resource Discovery  => $KONG_SOCKET/discovery"
echo "Data Collector      => $KONG_SOCKET/collector"
echo "Actuator Controller => $KONG_SOCKET/actuator"
echo "Tagger              => `minikube service --url tagger-service -n interscity`/tagger"
echo ""
echo "Postgres => psql -h `minikube service --url postgres-service -n interscity | cut -c 8- | sed -e 's/:/ -p /g'` -U postgres"
echo "Senha padrão: admin"
