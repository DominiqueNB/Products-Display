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
        let url: URL = .init(string: "https://api.mercadolibre.com/sites/MLA/search?q=\(item)")!

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
                  condition: $0.condition,
                  thumbnailID: $0.thumbnailID,
                  catalogProductID: $0.catalogProductID,
                  listingTypeID: $0.listingTypeID,
                  buyingMode: $0.buyingMode,
                  siteID: $0.siteID,
                  categoryID: $0.categoryID,
                  domainID: $0.domainID,
                  thumbnail: $0.thumbnail,
                  orderBackend: $0.orderBackend,
                  price: $0.price,
                  availableQuantity: $0.availableQuantity,
                  useThumbnailID: $0.useThumbnailID,
                  acceptsMercadopago: $0.acceptsMercadopago,
                  seller: $0.seller,
                  attributes: $0.attributes,
                  installments: $0.installments)
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

