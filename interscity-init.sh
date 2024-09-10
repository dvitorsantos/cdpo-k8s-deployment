
echo "(INFO) Criando namespace interscity..."

minikube kubectl -- create namespace interscity

echo "(INFO) Configurando chaves de acesso ao repositório"

minikube kubectl -- create secret docker-registry interscity-secret --docker-server=registry.lsdi.ufma.br --docker-username=aluno --docker-password=public@c@o -n interscity

echo "(INFO) Criando volumes dos bancos de dados..."
minikube kubectl -- apply -f ./persistence

echo "(INFO) Aguardando serviços inicializarem..."
sleep 10

echo "(INFO) Criando bancos de dados..."
minikube kubectl -- apply -f ./postgres
minikube kubectl -- apply -f ./redis
minikube kubectl -- apply -f ./mongo
minikube kubectl -- apply -f ./kong

echo "(INFO) Aguardando serviços inicializarem..."
sleep 40

echo "(INFO) Criando serviços de mensageria..."
minikube kubectl -- apply -f ./rabbitmq

echo "(INFO) Aguardando serviços inicializarem..."
sleep 10

echo "(INFO) Aplicando configurações..."

minikube kubectl -- apply -f ./config

echo "(INFO) Criando serviços do InterSCity..."
minikube kubectl -- apply -f ./actuator-controller
minikube kubectl -- apply -f ./data-collector
minikube kubectl -- apply -f ./resource-adaptor
minikube kubectl -- apply -f ./resource-cataloguer
minikube kubectl -- apply -f ./resource-discovery
minikube kubectl -- apply -f ./tagger