public enum Result<Value, Error> {
  case success(Value)
  case failure(Error)
}

public struct GitHub { 
  public struct Repo: Decodable {
    var archived: Bool
    var description: String?
    var htmlUrl: URL
    var name: String
    var pushedAt: Date?
    
    public init(
        archived: Bool,
        description: String?,
        htmlUrl: URL,
        name: String,
        pushedAt: Date?) {
            self.archived = archived
            self.description = description
            self.htmlUrl = htmlUrl
            self.name = name
            self.pushedAt = pushedAt
    }
  }
    
    init() {}
    
    public init(fetchRepos: @escaping ((Result<[GitHub.Repo], Error>) -> Void) -> Void) {
        self.fetchRepos = fetchRepos
    }

    public var fetchRepos = fetchRepos(onComplete:)
}

private func fetchRepos(onComplete completionHandler: (@escaping (Result<[GitHub.Repo], Error>) -> Void)) {
    dataTask("users/danwallacenz/repos", completionHandler: completionHandler)
}

private func dataTask<T: Decodable>(_ path: String, completionHandler: (@escaping (Result<T, Error>) -> Void)) {
  let request = URLRequest(url: URL(string: "https://api.github.com/" + path)!)
  URLSession.shared.dataTask(with: request) { data, urlResponse, error in
    do {
      if let error = error {
        throw error
      } else if let data = data {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(formatter)
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        completionHandler(.success(try decoder.decode(T.self, from: data)))
      } else {
        fatalError()
      }
    } catch let finalError {
      completionHandler(.failure(finalError))
    }
    }.resume()
}
