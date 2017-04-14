//
//  TweetViewCell.swift
//  TwitterClient
//
//  Created by Kumawat, Diwakar on 4/12/17.
//  Copyright © 2017 Kumawat, Diwakar. All rights reserved.
//

import UIKit

protocol TweetViewCellRetweetDelegate : class {
    func retweet(tweetViewCell: TweetViewCell)
}


class TweetViewCell: UITableViewCell {

    var tweet: Tweet!    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var handle: UILabel!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var post: UILabel!
    
    weak var retweetDelegate: TweetViewCellRetweetDelegate?
    
    
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
    
    
    @IBAction func retweetAction(_ sender: Any) {
        print("TweetViewCell -> retweet")
        retweetDelegate?.retweet(tweetViewCell: self)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
