import Gen

var xoshiro = Xoshiro()

public enum NameError: Error {
    case EmptyNameArgument(String)
    case EmptyNamesArgument(String)
}

public func randomEnglishGreeting(_ name: String) throws -> String {
    guard !name.isEmpty else {
        throw NameError.EmptyNameArgument("expected a non-empty string")
    }
    
    let greetings = [
        "Hi, \(name). Welcome!",
        "Great to see you, \(name)!",
        "Hail, \(name)! Well met!",
    ]
    
    return Gen.element(of: greetings).run(using: &xoshiro)!
}

public func randomEnglishGreetings(_ names: String...) throws -> [String] {
    guard !names.isEmpty else {
        throw NameError.EmptyNamesArgument("expected at least one name")
    }
    
    var greetings = [String]()
    
    for name in names {
        greetings.append(try randomEnglishGreeting(name))
    }
    
    return greetings
}
