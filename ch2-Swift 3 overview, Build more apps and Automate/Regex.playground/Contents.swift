//: Playground - noun: a place where people can play

import UIKit

//1
func findMatch(source: String, pattern: String) -> [String] {
    
    let linkRegex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    let matches = linkRegex.matches(in: source, range: NSMakeRange(0, source.utf16.count))
    
    let links = matches.map { result -> String in
        let hrefRange = result.rangeAt(1)
        let start = String.UTF16Index(hrefRange.location)
        let end = String.UTF16Index(hrefRange.location + hrefRange.length)
        
        return String(source.utf16[start..<end])!
    }
    
    return links
}

//2
func matches(for regex: String, in text: String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: regex)
        let nsString = text as NSString
        let results = regex.matches(in: text, range: NSRange(location: 0, length: nsString.length))
        return results.map { nsString.substring(with: $0.range)}
    } catch let error {
        print("invalid regex: \(error.localizedDescription)")
        return []
    }
}

//------------------------------------------------------------------

//Example
let htmlText = "Questions? Corrections? <a href=\"https://twitter.com/NSHipster\">@NSHipster</a> or <a href=\"https://github.com/NSHipster/articles\">on GitHub</a>."
let linkPattern = "<a\\s+[^>]*href=\"([^\"]*)\"[^>]*>"
findMatch(source: htmlText, pattern: linkPattern)
print(matches(for: linkPattern, in: htmlText))

let numberText = "🇩🇪€4€9"
let numberPattern = "[0-9}"
print(matches(for: numberPattern, in: numberText))

let string2 = "Frog jumped 8125 times"

//\d:match any digits between 0-9
print(matches(for: "\\d+", in: string2)) //8125

//\w:match any characters between a-z or A-Z
print(matches(for: "\\w+", in: string2)) //F

//$: looks for matches at the end of the string
print(matches(for: "\\w+$", in: string2))

//\b: matches word boundary characters such as spaces and punctuation
print(matches(for: "jumped\\b", in: string2))

//\s: match any whitespace characters such as spaces tabs and newlines
print(matches(for: "\\w+\\s\\w+", in: string2))

//W: matches any non word character
print(matches(for: "\\w+\\W\\w+", in: string2))

//. matches any single character
print(matches(for: "time.", in: string2))

//* matches 0 or more characters
print(matches(for: "89*5", in: "89999999999995"))

//combining .*
print(matches(for: "Fr.*", in: string2))


let string4 = "1 Orange or Apple fell down"

//[]: Character classes represents a set of single character matches within a square bracket
print(matches(for: "[a-zA-Z]", in: string4))

//{}: Curly braces in REGEX are used to to define minimum and maxomin number of matches in a given pattern
print(matches(for: "[a-zA-z]{1,8}", in: string4))

//(): Paranthess in REGEX are used to group a part of pattern and can create a powerful a powerful search when combined with | and ?
print(matches(for: "(Apple|Orange|Pineapple)", in: string4))


let string5 = "December 22nd is the shortest day of the year"
print(matches(for: "Dec(ember)?", in: string5))

//^ Caret: matches at the begining of the string

matches(for: "^[0-9]", in: string4)

let phoneNumberText = "AutoTest phone number is 408-999-0502"
print(matches(for: "[0-9]{1,3}-[0-9]{1,3}-[0-9]{1,4}", in: phoneNumberText))

let urlText = "Loading page http://autotest.com"
let urlPattern = "[a-zA-Z]{1,4}\\:\\//[a-zA-z0-9]{1,60}\\.[a-zA-Z]{1,4}"
print(matches(for: urlPattern, in: urlText))

let domainPattern = "[a-zA-Z0-9]{1,60}\\.[a-zA-Z]{1,4}"
print(matches(for: domainPattern, in: urlText))
















