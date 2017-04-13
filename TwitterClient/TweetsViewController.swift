//
//  TweetsViewController.swift
//  TwitterClient
//
//  Created by Kumawat, Diwakar on 4/12/17.
//  Copyright © 2017 Kumawat, Diwakar. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    var tweets: [Tweet]!
    
    @IBOutlet weak var tweetTableView: UITableView!
    
    @IBAction func onLogout(_ sender: Any) {
        TwitterClient.sharedInstance?.logout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTableView.dataSource = self
        tweetTableView.delegate = self
//        tweetTableView.rowHeight = UITableViewAutomaticDimension
//        tweetTableView.estimatedRowHeight = 400

        TwitterClient.sharedInstance?.homeTimeline(success: { (tweets: [Tweet]) in
            for tweet in tweets {
                print(tweet.text!)
            }
            self.tweets = tweets
            self.tweetTableView.reloadData()
        }, failure: { (error: Error) in
            print(error)
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        print("number of rows")
        
        if let tweets = tweets {
            return tweets.count
        } else {
            return 0
        }
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tweetTableView.dequeueReusableCell(withIdentifier: "TweetViewCell", for: indexPath) as! TweetViewCell
        
        let tweet = tweets![indexPath.row] as Tweet

        let user = tweet.user! as User
        cell.tweet = tweet
        
        cell.post.text = (tweet.text! as NSString) as String
        cell.name.text = (user.name! as NSString) as String
        cell.handle.text = "@" + ((user.screenName!) as String) as String
        cell.profileImageView.setImageWith((user.profileImageUrl as? URL)!)

        print("row \(indexPath.row)")
        return cell
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
