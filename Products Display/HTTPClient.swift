//
//  HTTPClient.swift
//  Products Display
//
//  Created by Dominique Bezerra on 18/06/24.
//

import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}

public class URLSessionHTTPClient: HTTPClient {
    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    private struct UnexpectedValuesRepresentation: Error { }

    public func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void) {
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data, let response = response as? HTTPURLResponse {
                completion(.success(data, response))
            } else {
                completion(.failure(UnexpectedValuesRepresentation()))
            }

        }.resume()
    }
}

public final class Service {
    private let url: URL
    private let client: HTTPClient

    public enum Error: Swift.Error {
        case connectivity
        case invalidData
    }

    public typealias Result = ProductResult

    public init(url: URL, client: HTTPClient) {
        self.url = url
        self.client = client
    }

    public func load(completion: @escaping (Result) -> Void) {
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
        map { .init(id: $0.id, title: $0.title, condition: $0.condition, thumbnailID: $0.thumbnailID, catalogProductID: $0.catalogProductID, listingTypeID: $0.listingTypeID, permalink: $0.permalink, buyingMode: $0.buyingMode, siteID: $0.siteID, categoryID: $0.categoryID, domainID: $0.domainID, thumbnail: $0.thumbnail, currencyID: $0.currencyID, orderBackend: $0.orderBackend, price: $0.price, availableQuantity: $0.availableQuantity, useThumbnailID: $0.useThumbnailID, acceptsMercadopago: $0.acceptsMercadopago, shipping: $0.shipping, stopTime: $0.stopTime, seller: $0.seller, attributes: $0.attributes, installments: $0.installments, catalogListing: $0.catalogListing) }
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
              let search = try? JSONDecoder().decode(Search.self, from: data) else {
            throw Service.Error.invalidData
        }

        return search.results
    }
}
