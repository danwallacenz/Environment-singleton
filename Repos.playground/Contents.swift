import UIKit
import ReposKit

let reposViewController = ReposViewController()

extension GitHub.Repo {
    static let mock =
    GitHub.Repo(
        archived: false,
        description: "Blob's blog",
        htmlUrl: URL(string: "https://www.pointfree.co")!,
        name: "Bloblog",
        pushedAt: .mock - 24*60*60 * 124)
}

extension GitHub {
    static let mock = GitHub(fetchRepos: { callback in
        callback(
          .success([.mock])
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

extension Locale {
    static let mock = Locale(identifier: "en_NZ")
    static let mockHongKong = Locale(identifier: "zh_HK")
    static let mockGermany = Locale(identifier: "de_DE")
}

extension Calendar {
    static var mock: Calendar {
        var c = Calendar(identifier: .gregorian)
        c.locale = .mock
        return c
    }
}

extension Analytics {
    static let mock = Analytics(
        track: { event in
            print("Mock track", event)
        }
    )
}

extension Date {
    static let mock
        = Date(
            timeIntervalSinceReferenceDate: 590561316
        )
}

extension Environment {
    static let mock = Environment(
        analytics: .mock,
        calendar: .mock,
        date: { .mock },
        device: .mock,
        gitHub: .mock,
        screen: .mock,
        version: .mock
    )
}

extension Device {
    static let mock = Device(systemName: "Mock iOS", systemVersion: "11.mock")
}

extension Screen {
    static let mock
        = Screen(
        height: "568",
        width: "376"
    )
}

extension Version {
    static let mock = Version(build: "42", release: "0.0.1")
}

//Current.gitHub.fetchRepos = { callback in
//  callback(.failure(NSError.init(domain: "co.pointfree", code: 1, userInfo: [NSLocalizedDescriptionKey: "Ooopsy daisy!"])))
//}

//Current.analytics.track = { event in
//    print("Test tracked", event)
//}

//Current.analytics = .mock

//Current.gitHub = .mock
//Current.gitHub = .errorMock

Date.timeIntervalSinceReferenceDate

//Current.date = Date.init
//Current.date = { Date() }
//Current.date = { Date(timeIntervalSinceReferenceDate: 590561316) }

Current = Environment()
Current.calendar = .mock
//Current = .mock

import PlaygroundSupport
let vc = UINavigationController(rootViewController: reposViewController)
PlaygroundPage.current.liveView = vc
