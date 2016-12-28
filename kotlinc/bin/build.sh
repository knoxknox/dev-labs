echo "compiling source code..."
kotlinc $PWD/src/App.kt -include-runtime -d /tmp/app.jar && java -jar /tmp/app.jar
