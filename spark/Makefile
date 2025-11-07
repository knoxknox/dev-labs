build:
	rm -f /tmp/modules.zip
	find src -name '*.pyc' | xargs rm
	cd src && zip -x main.py -r /tmp/modules.zip .

submit:
	./spark/bin/spark-submit --py-files /tmp/modules.zip src/main.py
