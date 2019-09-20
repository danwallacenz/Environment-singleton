import UIKit

public struct Screen {
    public var height = String(describing: UIScreen.main.bounds.height)
    public var width = String(describing: UIScreen.main.bounds.width)
    
    init() {}
    
    public init(
        height: String,
        width: String) {
        self.height = height
        self.width = width
    }
}
