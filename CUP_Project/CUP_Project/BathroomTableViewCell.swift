//
//  BathroomTableViewCell.swift
//  jzp5
//
//  Created by Jerry Peng on 11/24/19.
//  Copyright © 2019 Jerry Peng. All rights reserved.
//

import UIKit
import Cosmos

class BathroomTableViewCell: UITableViewCell {
    
    var bathroomLabel: UILabel!
    var descriptionLabel: UILabel!
    var ratingLabel: UILabel!
    lazy var cosmosView: CosmosView = {
        var view = CosmosView()
        view.settings.updateOnTouch = false
        return view
    }()
    
    let padding: CGFloat = 9
    let leadPadding: CGFloat = 120
    let leadPaddingImage: CGFloat = 20
    let spacing: CGFloat = 3
    let spacing2: CGFloat = 1
    let labelHeight: CGFloat = 35
    let labelHeight2: CGFloat = 20
    let albumLength: CGFloat = 80
    let albumPadding: CGFloat = 10
    let arrowImageLength: CGFloat = 15

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        bathroomLabel = UILabel()
        bathroomLabel.font = UIFont.systemFont(ofSize: 23)
        bathroomLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bathroomLabel)
        
        descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        
        cosmosView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cosmosView)
        
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            bathroomLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leadPadding),
            bathroomLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            bathroomLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: bathroomLabel.leadingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: labelHeight2),
            descriptionLabel.topAnchor.constraint(equalTo: bathroomLabel.bottomAnchor, constant: spacing)
        ])
        
        NSLayoutConstraint.activate([
            cosmosView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leadPadding),
            cosmosView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor)
        ])
    }
    
    func configure(for bathroom: Bathroom) {
        bathroomLabel.text = bathroom.name
        descriptionLabel.text = bathroom.description
        ratingLabel.text = "0"
        cosmosView.rating = bathroom.avgRating
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
