
public struct Version {
    public var build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "Unknown"
    public var release = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Unknown"
    
    init() {}
    
    public init(
        build: String,
        release: String ) {
        self.build = build
        self.release = release
    }
}


