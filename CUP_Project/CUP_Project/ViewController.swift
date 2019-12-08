//
//  ViewController.swift
//  jzp5
//
//  Created by Jerry Peng on 11/24/19.
//  Copyright © 2019 Jerry Peng. All rights reserved.
//

import UIKit

protocol ChangeDelegate: class {
    func changeBathroomNameText(to bathroomNameString: String)
    func changeLocationText(to locationString: String)
    func changeRatingText(to ratingString: String)
}

class ViewController: UIViewController {

    var tableView: UITableView!
    var arr = [UIView]()
    let reuseIdentifier = "bathroomCellReuse"
    let cellHeight: CGFloat = 100
    var list: [Bathroom]!
    var path: IndexPath?
    var cell: BathroomTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "CUP: Bathroom Locator"
        view.backgroundColor = .white
        
        let appelSecondFloor = Bathroom(name: "Appel (Second Floor)", location: "Appel Commons", rating: "2.5/5", image: "insert image name here")
        
        list = [appelSecondFloor]

        // Initialize tableView
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(BathroomTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)

        setupConstraints()
    }

    func setupConstraints() {
        // Setup the constraints for our views
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

}

/// UITableViewDataSource
/// - Tell the table view how many rows should be in each section
/// - Tell the table view what cell to display for each row
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! BathroomTableViewCell
        let bathroom = list[indexPath.row]
        cell.configure(for: bathroom)
        cell.selectionStyle = .none
        return cell
    }
}

/// UITableViewDelegate
/// - Tell the table view what height to use for each row
/// - Tell the table view what should happen if we select a row
/// - Tell the table view what should happen if we deselect a row
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        path = indexPath

        let viewController = DetailViewController(textFieldText: "text")
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ViewController: ChangeDelegate {
    func changeBathroomNameText(to bathroomNameString: String) {
        let bathroom = list[path!.row]
        let cell = tableView.cellForRow(at: path!) as? BathroomTableViewCell
        bathroom.setBathroomName(to: bathroomNameString)
        cell!.configure(for: bathroom)
    }
    
    func changeLocationText (to locationString: String) {
        let bathroom = list[path!.row]
        let cell = tableView.cellForRow(at: path!) as? BathroomTableViewCell
        bathroom.setLocation(to: locationString)
        cell!.configure(for: bathroom)
    }
    
    func changeRatingText(to ratingString: String) {
        let bathroom = list[path!.row]
        let cell = tableView.cellForRow(at: path!) as? BathroomTableViewCell
        bathroom.setRating(to: ratingString)
        cell!.configure(for: bathroom)
    }
    
}
