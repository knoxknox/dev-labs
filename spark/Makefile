run:
	rm -f /tmp/modules.zip
	cd ~/workspace/src && find . -name '*.pyc' | xargs rm
	cd ~/workspace/src && zip -x main.py -r /tmp/modules.zip .
	cd ~/workspace && ./spark/bin/spark-submit --py-files /tmp/modules.zip src/main.py
