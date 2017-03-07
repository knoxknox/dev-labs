package coding

class Cipher(val offset: Int) {

    public fun encode(string: String): String {
        val builder = StringBuilder()

        for (char in string) {
            val ascii = char.toInt()
            builder.append((ascii + this.offset).toChar())
        }

        return builder.toString()
    }

    public fun decode(string: String): String {
        val builder = StringBuilder()

        for (char in string) {
            val ascii = char.toInt()
            builder.append((ascii - this.offset).toChar())
        }

        return builder.toString()
    }

}
