//
//  NewsTableViewController.swift
//  SlideDownMenu
//
//  Created by Terry Jason on 2024/1/9.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    let menuTransitionManager = MenuTransitionManager()
    
}

// MARK: - Life Cycle

extension NewsTableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
    }
    
}

// MARK: - Action Methods

extension NewsTableViewController {
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        let sourceVC = segue.source as! MenuTableViewController
        self.title = sourceVC.currentItem
    }
    
}

// MARK: - Navigation

extension NewsTableViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let menuTableVC = segue.destination as! MenuTableViewController
        
        menuTableVC.currentItem = self.title!
        menuTableVC.transitioningDelegate = menuTransitionManager
        menuTableVC.modalPresentationStyle = .fullScreen
        
        menuTransitionManager.delegate = self
    }
    
}

// MARK: - Table view data source

extension NewsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.postImageView.image = UIImage(named: "img1")
            cell.postTitle.text = "Title-1"
            cell.postAuthor.text = "Dasha Taran (@dashataran)"
            cell.authorImageView.image = UIImage(named: "bill")
        case 1:
            cell.postImageView.image = UIImage(named: "img2")
            cell.postTitle.text = "Title-2"
            cell.postAuthor.text = "Bill Gates (bill-gates.com)"
            cell.authorImageView.image = UIImage(named: "bill")
        case 2:
            cell.postImageView.image = UIImage(named: "img3")
            cell.postTitle.text = "Title-3"
            cell.postAuthor.text = "Dasha Taran (@dashataran)"
            cell.authorImageView.image = UIImage(named: "bill")
        default:
            cell.postImageView.image = UIImage(named: "img4")
            cell.postTitle.text = "Title-4"
            cell.postAuthor.text = "Dasha Taran (@dashataran)"
            cell.authorImageView.image = UIImage(named: "bill")
        }
        
        return cell
    }
    
}

// MARK: - Table View Delegate

extension NewsTableViewController {
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 200, 0)
        
        cell.alpha = 0
        cell.layer.transform = rotationTransform
        
        UIView.animate(withDuration: 1.0, animations: {
            cell.alpha = 1
            cell.layer.transform = CATransform3DIdentity
        })
        
    }
    
}

// MARK: - MenuTransitionManagerDelegate

extension NewsTableViewController: MenuTransitionManagerDelegate {
    
    func dismiss() {
        dismiss(animated: true)
    }
    
}

