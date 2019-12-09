//
//  ViewController.swift
//  jzp5
//
//  Created by Jerry Peng on 11/24/19.
//  Copyright © 2019 Jerry Peng. All rights reserved.
//

import UIKit
import Cosmos
import Alamofire

protocol ChangeDelegate: class {
    func changeBathroomNameText(to bathroomNameString: String)
    func changeLocationText(to locationString: String)
    func changeRating(to newRating: Double)
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
        
//        //let parameters: [String: String] = [
//            "name": "Appel (Second Floor)",
//            "description": "Our very first bathroom"
//        ]
//
        //let something = AF.request("http://35.231.165.9/bathrooms/", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
        //let jsonData: JSON
        var jsonData: Data
        AF.request("http://35.231.165.9/bathrooms/").responseJSON{ response in
            let jsonData = response.result as! NSDictionary
        }
        let decoder = JSONDecoder()
        do {
            let bathrooms = try decoder.decode([Bathroom].self, from: jsonData)
            print(bathrooms)
        } catch {
            print(error.localizedDescription)
        }
        
        
        let b1 = Bathroom
        list = [b1]

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
    
    func changeRating(to newRating: Double) {
        let bathroom = list[path!.row]
        let cell = tableView.cellForRow(at: path!) as? BathroomTableViewCell
        bathroom.setRating(to: newRating)
        cell!.configure(for: bathroom)
    }
    
}
