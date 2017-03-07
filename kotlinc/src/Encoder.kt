package coding

class Encoder(val string: String) {
    public fun encode(offset: Int): String {
        val builder = StringBuilder()

        for (char in this.string) {
            val ascii = char.toInt()
            builder.append((ascii + offset).toChar())
        }

        return builder.toString()
    }
}
