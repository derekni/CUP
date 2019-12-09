//
//  DetailViewController.swift
//  jzp5
//
//  Created by Jerry Peng on 11/26/19.
//  Copyright © 2019 Jerry Peng. All rights reserved.
//

import UIKit
import Cosmos
import Alamofire

class DetailViewController: UIViewController {
    
    var bathroomLabel: UILabel!
    
    var descriptionLabel: UILabel!
    
    lazy var ratingField: CosmosView = {
        var view = CosmosView()
        return view
    }()
    var ratingLabel: UILabel!
    
    var textFieldText: String
    
    var delegate: ChangeDelegate?
    
    var saveButton: UIBarButtonItem!
    
    init(textFieldText: String) {
        self.textFieldText = textFieldText
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Details"
        view.backgroundColor = .white
        
        //        bathroomField = UITextField()
        //        bathroomField.translatesAutoresizingMaskIntoConstraints = false
        //        bathroomField.text = ""
        //        bathroomField.textColor = .darkGray
        //        bathroomField.borderStyle = .roundedRect
        //        bathroomField.backgroundColor = .white
        //        bathroomField.textAlignment = .left
        //        bathroomField.clearsOnBeginEditing = true
        //        view.addSubview(bathroomField)
        
        bathroomLabel = UILabel()
        bathroomLabel.translatesAutoresizingMaskIntoConstraints = false
        bathroomLabel.font = UIFont.systemFont(ofSize: 32)
        bathroomLabel.text = delegate?.getName()
        view.addSubview(bathroomLabel)
        
        //        locationField = UITextField()
        //        locationField.translatesAutoresizingMaskIntoConstraints = false
        //        locationField.text = ""
        //        locationField.textColor = .darkGray
        //        locationField.borderStyle = .roundedRect
        //        locationField.backgroundColor = .white
        //        locationField.textAlignment = .left
        //        locationField.clearsOnBeginEditing = true
        //        view.addSubview(locationField)
        
        descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.text = delegate?.getDescription()
        view.addSubview(descriptionLabel)
        
        ratingField.translatesAutoresizingMaskIntoConstraints = false
        ratingField.rating = 0
        view.addSubview(ratingField)
        
        ratingLabel = UILabel()
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "Rating:"
        ratingLabel.textColor = .orange
        view.addSubview(ratingLabel)
        
        saveButton = UIBarButtonItem()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTapped))
        
        setupConstraints()
    }
    
    @objc func saveTapped() {
        //        if (locationField.text != "") {
        //            delegate?.changeLocationText(to: locationField.text!)
        //        }
        //        if (bathroomField.text != "") {
        //            delegate?.changeBathroomNameText(to: bathroomField.text!)
        //        }
        delegate?.changeAvgRating(to: Float(ratingField.rating))
        navigationController?.popViewController(animated: true)
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            bathroomLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            bathroomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bathroomLabel.heightAnchor.constraint(equalToConstant: 45)
            ])
        
        //        NSLayoutConstraint.activate([
        //            bathroomField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 101),
        //            bathroomField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 184),
        //            bathroomField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        //            bathroomField.heightAnchor.constraint(equalToConstant: 24)
        //        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        //        NSLayoutConstraint.activate([
        //            locationField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 151),
        //            locationField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 125),
        //            locationField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
        //            locationField.heightAnchor.constraint(equalToConstant: 24)
        //        ])
        
        NSLayoutConstraint.activate([
            ratingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            ratingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ratingLabel.heightAnchor.constraint(equalToConstant: 24)
            ])
        
        NSLayoutConstraint.activate([
            ratingField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 230),
            ratingField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ratingField.heightAnchor.constraint(equalToConstant: 24)
            ])
    }
    
}
