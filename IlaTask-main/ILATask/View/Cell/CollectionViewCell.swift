//
//  CollectionViewCell.swift
//  ILATask
//
//  Created by Ravikumar, Gowtham on 14/10/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    let imageViews: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "placeholder")
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureLayout() {
        contentView.addSubview(imageViews)
        NSLayoutConstraint.activate([
            imageViews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageViews.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
