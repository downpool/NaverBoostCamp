import Foundation

//["from":["by":"to"]]
let States: [String:[String:String]] = [
    "IDLE": ["INVITE":"INVITED"],
    "INVITED": ["1xx":"INVITED", "200":"ACCEPTED", "CANCEL":"CANCELLING", 
        "3xx":"REDIRECTING", "407":"AUTH REQUESTED", "4xx-6xx":"FAILED"],
    "AUTH REQUESTED": ["ACK":"INVITED"],
    "ACCEPTED":["ACK":"ESTABLISHED", "CANCEL":"CANCELLING"],
    "ESTABLISHED":["BYE":"CLOSING"],
    "REDIRECTING":["ACK":"REDIRECTED"],
    "CLOSING":["BYE":"CLOSING", "200(BYE)":"TERMINATED"],
    "CANCELLING":["200(CANCEL)":"CANCELED"],
    "CANCELLED":["487":"FAILED"],
    "REDIRECTED":["<timeout>":"TERMINATED"],
    "FAILED":["ACK":"TERMINATED"]
]

func matches(_ input: String, _ pattern: String) -> Bool {
    if pattern == "1xx", input.hasPrefix("1") { return true }
    if pattern == "3xx", input.hasPrefix("3") { return true }
    if pattern == "4xx-6xx" {
        if let first = input.first, "456".contains(first) { return true }
    }
    return input == pattern
}

var currentState = "IDLE"
var saveStates:[String] = []

var input = ["INVITE", "407", "ACK", "301", "ACK", "<timeout>"]

for mov in input {
    if let transitions = States[currentState] {
        if let next = transitions[mov] {
            currentState = next
        }else{
            if let next = transitions.first(where: { matches(mov, $0.key) })?.value {
                currentState = next
            }
        }
    }
    if currentState == saveStates.last{
        continue
    }else{
        saveStates.append(currentState)
    }
}

print(saveStates)