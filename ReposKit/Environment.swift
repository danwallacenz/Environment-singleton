
public struct Environment {
    public var analytics = Analytics()
    // always produces the current date
    // just having a date would freeze it
    public var date: () -> Date = Date.init
    public var gitHub = GitHub()
    
    public init(
        analytics: Analytics,
        date: @escaping () -> Date,
        gitHub: GitHub) {
        self.analytics = analytics
        self.date = date
        self.gitHub = gitHub
    }
    
    init() {}
}

public var Current = Environment()
