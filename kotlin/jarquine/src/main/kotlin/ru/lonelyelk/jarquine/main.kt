package ru.lonelyelk.jarquine

fun main(args: Array<String>) {
    val quote = '"'
    val template =
        """
        package ru.lonelyelk.jarquine

        fun main(args: Array<String>) {
            val quote = '%c'
            val template =
                %c%c%c
                %s
                %c%c%c.trimIndent()
            val indentedTemplate = template.split(System.lineSeparator())
                .joinToString(System.lineSeparator() + "        ")
            println(template.format(quote, quote, quote, quote, indentedTemplate, quote, quote, quote))
        }
        """.trimIndent()
    val indentedTemplate = template.split(System.lineSeparator())
        .joinToString(System.lineSeparator() + "        ")
    println(template.format(quote, quote, quote, quote, indentedTemplate, quote, quote, quote))
}