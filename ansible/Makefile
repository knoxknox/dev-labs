build:
	ansible-playbook base/playbook.yml -i base/inventory.ini -e env=$$ENV -v

uptime:
	ansible-playbook base/playbook.yml -i base/inventory.ini -e env=$$ENV -v --tags='time'
