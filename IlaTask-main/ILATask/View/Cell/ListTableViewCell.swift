//
//  ListTableViewCell.swift
//  ILATask
//
//  Created by Ravikumar, Gowtham on 13/10/22.
//

import Foundation
import UIKit

class ListTableViewCell: UITableViewCell {

    static let identifier = "ListTableViewCell"
    private lazy var listName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    private lazy var imageViews: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "placeholder")
        return image
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureLayout() {
        addSubview(listName)
        addSubview(imageViews)
        NSLayoutConstraint.activate([
            imageViews.heightAnchor.constraint(equalToConstant: 80),
            imageViews.widthAnchor.constraint(equalToConstant: 80),
            imageViews.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageViews.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            listName.centerYAnchor.constraint(equalTo: imageViews.centerYAnchor),
            listName.leadingAnchor.constraint(equalTo: imageViews.trailingAnchor, constant: 15),
        ])
    }

    func configureList(list: SubListModel) {
        listName.text = list.name
        self.imageViews.image = UIImage(named: list.imageUrl)
    }
}
