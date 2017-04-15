//
//  TweetDetailViewController.swift
//  TwitterClient
//
//  Created by Kumawat, Diwakar on 4/14/17.
//  Copyright © 2017 Kumawat, Diwakar. All rights reserved.
//

import UIKit

class TweetDetailViewController: UIViewController {


    var tweetDetail: Tweet!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var tweet: UILabel!
    @IBOutlet weak var handle: UILabel!
    @IBOutlet weak var name: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        print(tweetDetail.text!)
        
        // set the tweet in ui
        let user = tweetDetail.user! as User
        print(user.name!)
        
        tweet.text = (tweetDetail.text! as NSString) as String
        name.text = (user.name! as NSString) as String
        handle.text = "@" + ((user.screenName!) as String) as String
        profileImage.setImageWith((user.profileImageUrl as? URL)!)
        
        print(tweet.text!)
        print(handle.text!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
