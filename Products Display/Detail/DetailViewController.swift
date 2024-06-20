//
//  DetailViewController.swift
//  Products Display
//
//  Created by Dominique Bezerra on 19/06/24.
//

import Foundation
import UIKit

final class DetailViewController: UIViewController {
    private lazy var detailView: View = {
        return View()
    }()

    private let item: ItemViewModel
    private let imageFetcher: DetailImageFetcherProtocol

    init(imageFetcher: DetailImageFetcherProtocol, item: ItemViewModel) {
        self.imageFetcher = imageFetcher
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()

        self.view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        detailView.render(item: item)
        updateImage()
    }

    func updateImage() {
        Task {
            await detailView.updateImage(imageFetcher.image(from: item.thumbnail))
        }
    }
}
