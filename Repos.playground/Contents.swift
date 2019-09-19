import UIKit
import ReposKit


let reposViewController = ReposViewController()

//Current.gitHub.fetchRepos = { callback in
//  callback(.failure(NSError.init(domain: "co.pointfree", code: 1, userInfo: [NSLocalizedDescriptionKey: "Ooops!"])))
//}

//Current.analytics.track = { event in
//    print("Test tracked", event)
//}

//Current.analytics = .mock
//Current.gitHub = .mock
//Current.date = { Date(timeIntervalSinceReferenceDate: 557152051) }
//Current.date = { Date.distantFuture }
//Current.date = { Date.distantPast }
//Current.date = { Date(timeIntervalSinceReferenceDate: 590551850) }

Date().timeIntervalSinceReferenceDate

//Current = .mock

import PlaygroundSupport
let vc = UINavigationController(rootViewController: reposViewController)
PlaygroundPage.current.liveView = vc
