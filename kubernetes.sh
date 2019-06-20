REGISTRY_DEMO_USERNAME='gitlab+deploy-token-3'
read -s REGISTRY_DEMO_PASSWORD

kubectl -n qa create secret docker-registry regcred --docker-server=docker.cloud.avalara.io --docker-username="$REGISTRY_DEMO_USERNAME" --docker-password="$REGISTRY_DEMO_PASSWORD" --docker-email="chander.singh@avalara.com"

kubectl -n production create secret docker-registry regcred --docker-server=docker.cloud.avalara.io --docker-username="$REGISTRY_DEMO_USERNAME" --docker-password="$REGISTRY_DEMO_PASSWORD" --docker-email="chander.singh@avalara.com"

