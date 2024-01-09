//
//  NewsTableViewCell.swift
//  SlideDownMenu
//
//  Created by Terry Jason on 2024/1/9.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet var postImageView: UIImageView! {
        didSet {
            postImageView.layer.cornerRadius = 25.0
            postImageView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var postTitle: UILabel!
    @IBOutlet var postAuthor: UILabel!
    
    @IBOutlet var authorImageView: UIImageView! {
        didSet {
            authorImageView.layer.cornerRadius = authorImageView.frame.width / 2
            authorImageView.layer.masksToBounds = true
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
