global.location = "https://"
const strings = [
    "![]+[]",
    "!![]+[]",
    "[]+{}",
    "({}[+[]])+[]",
    "+{}+[]",
    "+'1e1000'+[]",
    "+'1e100'+[]",
    "[]['sort']['constructor']('return location')()+[]",
    "[]['sort']['constructor']('return escape')()('[')",
]
const digitEncoder = (digit) => {
    if (digit == 0) {
        return "+![]"
    }
    const arr = []
    for (let index = 0; index < digit; index++) {
        arr.push("+!![]")
    }
    return arr.join("")
}
const numberEncoder = (number) => {
    const digits = number.toString()
    const encodedDigits = []
    for (let index = 0; index < digits.length; index++) {
        const digit = digits[index];
        encodedDigits.push(digitEncoder(digit))
    }
    return `+(${encodedDigits.join("+[]+")})`
}
const encodeFromKnown = (known) => {
    return (expression) => {
        return expression.replace(/'([^']+)'/g, (_match, group) => {
            const replacement = []
            for (let index = 0; index < group.length; index++) {
                const letter = group[index];
                if (letter.match(/[0-9]/)) {
                    replacement.push(`(${digitEncoder(letter)}+[])`)
                } else if (Object.prototype.hasOwnProperty.call(known, letter)) {
                    replacement.push(known[letter])
                } else {
                    throw(new Error(`Unknown letter ${letter}`))
                }
            }
            return `(${replacement.join("+")})`
        })
    }
}
const letters = strings.reduce((acc, expression) => {
    const encodedExpression = encodeFromKnown(acc)(expression)
    const value = (new Function(`return ${encodedExpression}`))()
    for (let index = 0; index < value.length; index++) {
        const letter = value[index];
        if (letter.match(/[0-9]/)) {
            continue
        }
        if (!Object.prototype.hasOwnProperty.call(acc, letter)) {
            const indexString = numberEncoder(index)
            acc[letter] = `(${encodedExpression})[${indexString}]`
        }
    }
    return acc
}, {})
const encodeProgram = (program) => {
    const encoded = []
    const encodeFromLetters = encodeFromKnown(letters)
    for (let index = 0; index < program.length; index++) {
        const letter = program[index];
        if (letter.match(/[0-9]/)) {
            encoded.push(`(${digitEncoder(letter)}+[])`)
        } else if (Object.prototype.hasOwnProperty.call(letters, letter)) {
            encoded.push(letters[letter])
        } else {
            let lastUnknown
            const codes = [letter.charCodeAt(0).toString(16).toLowerCase()]
            for (let j = index + 1; j < program.length; j++) {
                const l = program[j];
                if (l.match(/[0-9]/) || Object.prototype.hasOwnProperty.call(letters, l)) {
                    lastUnknown = j-1
                    break
                } else {
                    codes.push(program.charCodeAt(j).toString(16).toLowerCase())
                }
            }
            index = lastUnknown || program.length-1
            encoded.push(encodeFromLetters(`[]['sort']['constructor']('return unescape')()('%${codes.join("%")}')`))
        }
    }
    return `(${encoded.join("+")})`
}
const transform = (program) => {
    const expression = `[]['sort']['constructor'](${encodeProgram(program)})()`
    return encodeFromKnown(letters)(expression)
}

// console.log(letters)
console.log(transform(`alert("!!''''''!!!!!!!!!'''''!!!!")`))