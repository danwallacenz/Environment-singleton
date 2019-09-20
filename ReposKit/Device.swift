import UIKit

public struct Device {
    var systemName = UIDevice.current.systemName
    var systemVersion = UIDevice.current.systemVersion
    
    init() {}
    
    public init(systemName: String, systemVersion: String) {
        self.systemName = systemName
        self.systemVersion = systemVersion
    }
}
