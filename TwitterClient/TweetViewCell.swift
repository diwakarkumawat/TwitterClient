//
//  TweetViewCell.swift
//  TwitterClient
//
//  Created by Kumawat, Diwakar on 4/12/17.
//  Copyright © 2017 Kumawat, Diwakar. All rights reserved.
//

import UIKit

class TweetViewCell: UITableViewCell {


    var tweet: Tweet!    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var handle: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var post: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImageView.layer.cornerRadius = 4
        profileImageView.clipsToBounds = true
        
//        post.preferredMaxLayoutWidth = post.frame.size.width + 100
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        post.preferredMaxLayoutWidth = post.frame.size.width + 100
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
