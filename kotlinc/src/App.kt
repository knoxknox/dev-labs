







package coding

import coding.Encoder
import coding.Decoder

fun main(args: Array<String>) {
    val offset = 5
    val string = "lorem ipsum"

    val encoded = Encoder(string).encode(offset)
    val decoded = Decoder(encoded).decode(offset)

    println("encoded: ${encoded}, decoded: ${decoded}")
}









fun main(args: Array<String>) {
    val offset = 5
    val string = "lorem ipsum"

    val encoded = encode(string, offset)
    println("encoded string: ${encoded}")

    val decoded = decode(encoded, offset)
    println("decoded string: ${decoded}")
}




