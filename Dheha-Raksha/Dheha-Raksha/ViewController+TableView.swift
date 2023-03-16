//
//  ViewController+TableView.swift
//  Dheha-Raksha
//
//  Created by Gokul on 16/03/23.
//

import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dict?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue a reusable cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let dict else {return UITableViewCell()}
        let keyAtIndex = Array(dict.keys)[indexPath.row]

        print(keyAtIndex) // Output: "key3"
        let value = dict[keyAtIndex]
        cell.textLabel?.text = "\(keyAtIndex) : \(value ?? 0)"
        
        return cell
    }

    
}
