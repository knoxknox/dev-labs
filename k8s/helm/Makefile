ls:
	helm ls

history:
	helm history app

install:
	helm upgrade --install app app-chart

rollback:
	helm rollback app ${ROLLBACK_VERSION}

install-nginx:
	sh app-chart/scripts/ingress-nginx-controller.sh

forward-ports:
	sh app-chart/scripts/ingress-nginx-port-forward.sh
