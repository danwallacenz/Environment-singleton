import UIKit
import ReposKit

let reposViewController = ReposViewController()

extension GitHub {
    
    static let mock = GitHub(fetchRepos: { callback in
        callback(
          .success(
            [
              GitHub.Repo(archived: false, description: "Blob's blog", htmlUrl: URL(string: "https://www.pointfree.co")!, name: "Bloblog", pushedAt: Date(timeIntervalSinceReferenceDate: 547152021))
            ]
          )
        )
    })
    
    static let errorMock = GitHub(fetchRepos: { callback in
      callback(
        .failure(NSError.init(
            domain: "co.pointfree",
            code: 1,
            userInfo: [NSLocalizedDescriptionKey: "Ooops!"])))
    })
}

extension Analytics {
    static let mock = Analytics(track: { event in
        print("Mock track", event)
    })
}

extension Environment {
    static let mock = Environment(
        analytics: .mock,
        date: { Date(timeIntervalSinceReferenceDate: 557152051) },
        gitHub: .mock
    )
}

//Current.gitHub.fetchRepos = { callback in
//  callback(.failure(NSError.init(domain: "co.pointfree", code: 1, userInfo: [NSLocalizedDescriptionKey: "Ooopsy daisy!"])))
//}

//Current.analytics.track = { event in
//    print("Test tracked", event)
//}

Current.analytics = .mock

//Current.gitHub = .mock
//Current.gitHub = .errorMock

Date.timeIntervalSinceReferenceDate

//Current.date = Date.init
//Current.date = { Date() }
Current.date = { Date(timeIntervalSinceReferenceDate: 590561316) }

//Current = .mock

import PlaygroundSupport
let vc = UINavigationController(rootViewController: reposViewController)
PlaygroundPage.current.liveView = vc
