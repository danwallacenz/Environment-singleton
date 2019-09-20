
public struct Environment {
    public var analytics = Analytics()
    // always produces the current date (unless mocked)
    // just having a date would freeze it
    public var date: () -> Date = Date.init
    public var device = Device()
    public var gitHub = GitHub()
    public var screen = Screen()
    public var version = Version()
    
    public init(
        analytics: Analytics,
        date: @escaping () -> Date,
        device: Device,
        gitHub: GitHub,
        screen: Screen,
        version: Version) {
        self.analytics = analytics
        self.date = date
        self.device = device
        self.gitHub = gitHub
        self.screen = screen
        self.version = version
    }
    
    init() {}
}

public var Current = Environment()
