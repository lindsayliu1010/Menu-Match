import Foundation

protocol APIClient {
  var session: URLSession { get }
}

extension APIClient {
  func performRequest<Response:Decodable>(url: String) async throws -> Response {
    guard let url = URL(string: url) else { throw APIError.invalidUrl(url) }
      
      var request = URLRequest(url: url)
      request.setValue("Bearer eXxUS48Ib1A0IPIjxUsRLLE_D5YUOsM3sxeLDEglBUb3CzHqXvwRNdvnZebkdKpxCoAldw9N0n33pMgBc60aZXbZw8JlPHlMTjhsfu7xSiiAqXVFgBq2J-SWHawdZHYx", forHTTPHeaderField: "Authorization")
      
    let response: Response = try await perform(request: request)
    return response
  }

  func perform<Response:Decodable>(request: URLRequest) async throws -> Response {
    let (data, response) = try await session.data(for: request)

    guard let http = response as? HTTPURLResponse else { throw APIError.invalidResponse }
    guard http.statusCode == 200 else {
      switch http.statusCode {
      case 400...499:
        let body = String(data: data, encoding: .utf8)
        throw APIError.requestError(http.statusCode, body ?? "<no body>")
      case 500...599:
        throw APIError.serverError
      default: throw APIError.invalidStatusCode("\(http.statusCode)")
      }
    }
    do {
      let jsonDecoder = JSONDecoder()


      // This is a hack to keep things simple
      // jsonDecoder.dateDecodingStrategy = .iso8601
      // OpenWeather date formatting is not iso8601
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)



      return try jsonDecoder.decode(Response.self, from: data)
    } catch let decodingError as DecodingError {
      throw APIError.decodingError(decodingError)
    }
  }
}
