//
//  Service.swift
//  Products Display
//
//  Created by Dominique Bezerra on 19/06/24.
//

import Foundation

protocol ServiceProtocol {
    func load(item: String, completion: @escaping (ProductResult) -> Void)
}

public final class Service: ServiceProtocol {
    private let client: HTTPClient

    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    public typealias Result = ProductResult

    public init(client: HTTPClient) {
        self.client = client
    }

    public func load(item: String, completion: @escaping (Result) -> Void) {
        var url: URL = .init(string: "https://api.mercadolibre.com/sites/MLA/search?")!
        let queryItem = URLQueryItem.init(name: "q", value: item.trimmingCharacters(in: .whitespacesAndNewlines))
        url.append(queryItems: [queryItem])

        client.get(from: url) { [weak self] result in
            guard self != nil else { return }

            switch result {
            case let .success(data, response):
                completion(Service.map(data, from: response))
            case .failure:
                completion(.failure(Error.connectivity))
            }
        }
    }

    private static func map(_ data: Data, from response: HTTPURLResponse) -> Result {
        do {
            let items = try ItemsMapper.map(data, from: response)
            return .success(items)
        } catch {
            return .failure(Error.invalidData)
        }
    }
}

private extension Array where Element == Results {
    func toModels() -> [Results] {
        map {
            .init(id: $0.id,
                  title: $0.title,
                  thumbnail: $0.title,
                  price: $0.price,
                  availableQuantity: $0.availableQuantity,
                  attributes: $0.attributes)
        }
    }
}

public enum ProductResult {
    case success([Results])
    case failure(Error)
}


final class ItemsMapper {
    private static var OK_200: Int { return 200 }

    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [Results] {
        guard response.statusCode == OK_200,
              let search: Search = try? JSONDecoder().decode(Search.self, from: data) else {
            throw Service.Error.invalidData
        }

        return search.results
    }
}

