//
//  DetailInteractor.swift
//  Products Display
//
//  Created by Dominique Bezerra on 20/06/24.
//

import UIKit

protocol DetailImageFetcherProtocol {
    func image(from path: String) async -> UIImage
}

final class DetailImageFetcher: DetailImageFetcherProtocol {
    func image(from path: String) async -> UIImage {
        guard let url = URL(string: path) else { return UIImage(named: "no-image.jpg")! }
        do {
            let image = try await downloadImage(url: url)
            return image
        } catch {
            return UIImage(named: "no-image.jpg")!
        }
    }

    private func downloadImage(url: URL) async throws -> UIImage {
        let (data, _) = try await URLSession.shared.data(from: url)
        guard let image = UIImage(data: data) else {
            return UIImage()
        }
        return image
    }
}
