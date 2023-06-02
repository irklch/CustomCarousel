//
//  CustomCarouselView.swift
//  CustomCarousel
//
//  Created by Ирина Кольчугина on 01.06.2023.
//

import UIKit
import SwiftExtension
import SnapKit

final class CustomCarouselView: UIView {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            CustomCarouselCell.self,
            forCellWithReuseIdentifier: CustomCarouselCell.withReuseIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.decelerationRate = .fast
        return collectionView
    }()

    private let views: [UIView]
    private let cellSpacing: CGFloat

    init(
        views: [UIView],
        cellSpacing: CGFloat
    ) {
        self.views = views
        self.cellSpacing = cellSpacing
        super.init(frame: .zero)
        setupView()
    }

    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

extension CustomCarouselView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        views.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CustomCarouselCell.withReuseIdentifier,
            for: indexPath) as? CustomCarouselCell,
              let view = views[safe: indexPath.row] else {
            return .init(frame: .zero)
        }
        return cell.setup(view: view)
    }
}

extension CustomCarouselView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return .init(
            width: collectionView.bounds.size.width.subtraction(cellSpacing),
            height: collectionView.bounds.size.height)
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(
            top: 0,
            left: cellSpacing.division(2),
            bottom: 0,
            right: cellSpacing.division(2))
    }
}
