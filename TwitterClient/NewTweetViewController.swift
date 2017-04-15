//
//  NewTweetViewController.swift
//  TwitterClient
//
//  Created by Kumawat, Diwakar on 4/14/17.
//  Copyright © 2017 Kumawat, Diwakar. All rights reserved.
//

import UIKit

class NewTweetViewController: UIViewController, UITextViewDelegate {
    
    var currentUser: User?
    
    
    @IBOutlet weak var myName: UILabel!
    
    @IBOutlet weak var handle: UILabel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var tweetText: UITextView!
    
    @IBAction func onTweet(_ sender: Any) {
        print("onTweetTap")
        print(tweetText.text!)
        TwitterClient.sharedInstance?.postTweet(message: tweetText.text!)
    }
    
    
//    func textViewDidBeginEditing(textView: UITextView) {
//        //tweetText.text = ""
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //tweetText.delegate = self
        //currentUser =  User.currentUser
        currentUser = User._currentUser
        myName.text = (currentUser?.name! as! String) as String
        handle.text = "@" + ((currentUser?.screenName!) as! String) as String
        //profileImageView.setImageWith((currentUser?.profileImageUrl as? URL)!)
        profileImageView.setImageWith((currentUser?.profileUrl as? URL)!)
        
        print(handle.text!)
        print(myName.text!)
        print(currentUser?.profileUrl as? URL)
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
