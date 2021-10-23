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
const transform = (program) => {
    const expression = `[]['sort']['constructor']('${program}')()`
    const encodeFromLetters = encodeFromKnown(letters)
    return expression.replace(/'([^']+)'/g, (_match, group) => {
        const replacement = []
        for (let index = 0; index < group.length; index++) {
            const letter = group[index];
            if (letter.match(/[0-9]/)) {
                replacement.push(`(${digitEncoder(letter)}+[])`)
            } else if (Object.prototype.hasOwnProperty.call(letters, letter)) {
                replacement.push(letters[letter])
            } else {
                let lastUnknown
                const codes = [letter.charCodeAt(0).toString(16).toLowerCase()]
                for (let j = index + 1; j < group.length; j++) {
                    const l = group[j];
                    if (l.match(/[0-9]/) || Object.prototype.hasOwnProperty.call(letters, l)) {
                        lastUnknown = j-1
                        break
                    } else {
                        codes.push(group.charCodeAt(j).toString(16).toLowerCase())
                    }
                }
                index = lastUnknown || group.length-1
                replacement.push(encodeFromLetters(`[]['sort']['constructor']('return unescape')()('%${codes.join("%")}')`))
            }
        }
        return `(${replacement.join("+")})`
    })
}

// console.log(letters)
console.log(transform('alert("!!!!!!!!!!!!!!!")'))