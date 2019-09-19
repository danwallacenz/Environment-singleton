import UIKit
import ReposKit

let reposViewController = ReposViewController()

public extension GitHub {
  static let mock = GitHub(fetchRepos: { callback in
    callback(
      .success(
        [
          GitHub.Repo(archived: false, description: "Blob's blog", htmlUrl: URL(string: "https://www.pointfree.co")!, name: "Bloblog", pushedAt: Date(timeIntervalSinceReferenceDate: 547152021))
        ]
      )
    )
  })
}

public extension Analytics {
  static let mock = Analytics(track: { event in
    print("Mock track", event)
  })
}

public extension Environment {
  static let mock = Environment(
    analytics: .mock,
    date: { Date(timeIntervalSinceReferenceDate: 557152051) },
    gitHub: .mock
  )
}

//Current.gitHub.fetchRepos = { callback in
//  callback(.failure(NSError.init(domain: "co.pointfree", code: 1, userInfo: [NSLocalizedDescriptionKey: "Ooops!"])))
//}

//Current.analytics.track = { event in
//    print("Test tracked", event)
//}

Current.analytics = .mock
Current.gitHub = .mock
//Current.date = { Date(timeIntervalSinceReferenceDate: 557152051) }
//Current.date = { Date.distantFuture }
//Current.date = { Date.distantPast }
//Current.date = { Date(timeIntervalSinceReferenceDate: 590551850) }
//Current.date = Date.init
//Current.date = { Date() }
Current.date = { Date(timeIntervalSinceReferenceDate: 557152051) }

//Current = .mock

import PlaygroundSupport
let vc = UINavigationController(rootViewController: reposViewController)
PlaygroundPage.current.liveView = vc
