package coding

import coding.Cipher

fun main(args: Array<String>) {
    val cipher = Cipher(5)

    val string = "lorem ipsum"
    val encoded = cipher.encode(string)
    val decoded = cipher.decode(encoded)

    println("encoded: ${encoded}, decoded: ${decoded}")
}
