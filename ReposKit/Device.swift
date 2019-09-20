import UIKit

public struct Device {
    public var systemName = UIDevice.current.systemName
    public var systemVersion = UIDevice.current.systemVersion
    
    init() {}
    
    public init(systemName: String, systemVersion: String) {
        self.systemName = systemName
        self.systemVersion = systemVersion
    }
}
