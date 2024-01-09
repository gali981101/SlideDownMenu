//
//  MenuTableViewController.swift
//  SlideDownMenu
//
//  Created by Terry Jason on 2024/1/9.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var menuItems = ["Home", "News", "Tech", "Finance", "Reviews"]
    var currentItem = "Home"
    
}

// MARK: - Life Cycle

extension MenuTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - Table view data source

extension MenuTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuTableViewCell
        
        cell.titleLabel.text = menuItems[indexPath.row]
        cell.titleLabel.textColor = (menuItems[indexPath.row] == currentItem) ? UIColor.white : UIColor.gray
        
        return cell
    }
    
}

// MARK: - Navigation

extension MenuTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let menuTableVC = segue.source as! MenuTableViewController
        
        if let selectedIndexPath = menuTableVC.tableView.indexPathForSelectedRow {
            currentItem = menuItems[selectedIndexPath.row]
        }
    }
    
}
