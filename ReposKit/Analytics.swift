
import UIKit

public struct Analytics {
    
    public struct Event {
        
        var name: String
        var properties: [String: String]

        static func tappedRepo(_ repo: GitHub.Repo) -> Event {
            
            return Event(
                name: "tapped_repo",
                properties: [
                  "repo_name": repo.name,
                  "build": Current.version.build,
                  "release": Current.version.release,
                  "screen_height": Current.screen.height,
                  "screen_width": Current.screen.width,
                  "system_name": Current.device.systemName,
                  "system_version": Current.device.systemVersion,
                  ]
            )
        }
    }

    public var track = track(_:)
    
    public init(track: @escaping (_ event: Analytics.Event) -> Void) {
        self.track = track
    }
    
    init() {}
}

private func track(_ event: Analytics.Event) {
    print("Tracked", event)
}
