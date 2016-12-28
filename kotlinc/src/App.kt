fun main(args: Array<String>) {
    val offset = 5
    val string = "lorem ipsum"

    val encoded = encode(string, offset)
    println("encoded string: ${encoded}")

    val decoded = decode(encoded, offset)
    println("decoded string: ${decoded}")
}

fun encode(string: String, offset: Int): String {
    val builder = StringBuilder()

    for (char in string) {
        val ascii = char.toInt()
        builder.append((ascii + offset).toChar())
    }

    return builder.toString()
}

fun decode(string: String, offset: Int): String {
    val builder = StringBuilder()

    for (char in string) {
        val ascii = char.toInt()
        builder.append((ascii - offset).toChar())
    }

    return builder.toString()
}
