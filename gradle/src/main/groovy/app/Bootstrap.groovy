package app

import static spark.Spark.*

class Bootstrap {
    public static void main(String[] args) {
        get("/ping", { req, res -> "localhost:4567" })
    }
}
