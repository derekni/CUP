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
    var locationLabel: UILabel!
    var ratingLabel: UILabel!
    var albumArt: UIImageView!
    var arrowImageView: UIImageView!
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
        
        locationLabel = UILabel()
        locationLabel.font = UIFont.systemFont(ofSize: 14)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(locationLabel)
        
        cosmosView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cosmosView)
        
        albumArt = UIImageView()
        albumArt.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(albumArt)

        
        arrowImageView = UIImageView(image: UIImage(named: "arrow"))
        arrowImageView.contentMode = .scaleAspectFit
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(arrowImageView)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            bathroomLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leadPadding),
            bathroomLabel.heightAnchor.constraint(equalToConstant: labelHeight),
            bathroomLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: bathroomLabel.leadingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: labelHeight2),
            locationLabel.topAnchor.constraint(equalTo: bathroomLabel.bottomAnchor, constant: spacing)
        ])
        
        NSLayoutConstraint.activate([
            cosmosView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leadPadding),
            cosmosView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            albumArt.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: leadPaddingImage),
            albumArt.heightAnchor.constraint(equalToConstant: albumLength),
            albumArt.widthAnchor.constraint(equalToConstant: albumLength),
            albumArt.topAnchor.constraint(equalTo: contentView.topAnchor, constant: albumPadding)
        ])
        
        NSLayoutConstraint.activate([
            arrowImageView.widthAnchor.constraint(equalToConstant: arrowImageLength),
            arrowImageView.heightAnchor.constraint(equalToConstant: arrowImageLength),
            arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            arrowImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(for bathroom: Bathroom) {
        bathroomLabel.text = bathroom.name
        locationLabel.text = bathroom.location
        cosmosView.rating = bathroom.rating
        albumArt.image = bathroom.image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
