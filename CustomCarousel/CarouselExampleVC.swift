//
//  CarouselExampleVC.swift
//  CustomCarousel
//
//  Created by Ирина Кольчугина on 01.06.2023.
//

import UIKit
import SnapKit

final class CarouselExampleVC: UIViewController {
    private lazy var carousel = CustomCarouselView(views: Self.getViews())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red.withAlphaComponent(0.2)
        setupView()
    }

    static func getViews() -> [UIImageView] {
        var views: [UIImageView] = []
        for item in 1..<11 {
            let imageView: UIImageView = .init(image: .init(named: item.description))
            imageView.contentMode = .scaleAspectFill
            views.append(imageView)
        }
        return views
    }

    private func setupView() {
        view.addSubview(carousel)
        carousel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(carousel.snp.width)
        }
    }
}

