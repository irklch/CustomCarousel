//
//  CarouselCell.swift
//  CustomCarousel
//
//  Created by Ирина Кольчугина on 01.06.2023.
//

import UIKit
import SnapKit

final class CarouselCell: UICollectionViewCell {
    static let withReuseIdentifier: String = .init(describing: CarouselCell.self)

    func setup(view: UIView) -> UICollectionViewCell {
        contentView.addSubview(view)
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return self
    }
}
