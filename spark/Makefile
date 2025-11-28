build:
	@rm -f /tmp/modules.zip
	@find src -name '*.pyc' | xargs rm
	@cd src && zip -x main.py -r /tmp/modules.zip .

submit:
	@docker cp src/main.py spark-spark-master-1:/opt/spark/work-dir
	@docker cp /tmp/modules.zip spark-spark-master-1:/opt/spark/work-dir
	@docker cp var/log/apache2/access.log spark-spark-master-1:/opt/spark/work-dir
	@docker exec spark-spark-master-1 /opt/spark/bin/spark-submit --master spark://spark-master:7077 --py-files modules.zip main.py
