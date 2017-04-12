//
//  LoginViewController.swift
//  TwitterClient
//
//  Created by Kumawat, Diwakar on 4/11/17.
//  Copyright © 2017 Kumawat, Diwakar. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func onLogin(_ sender: Any) {
        let twitterClient = BDBOAuth1SessionManager(baseURL: NSURL(string: "https://api.twitter.com")! as URL!, consumerKey: "7ecFpPfPSBNWBXUN5FJcYSsuM", consumerSecret: "eyKr9IeYmpRrGBMivlnd66Cvy0mESsGJt8DURBJlR2ZTdSfU3f")
        
        twitterClient?.deauthorize()
        
        /*
        twitterClient?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: nil, scope: nil, success: { (requestToken: BDBOAuth1Credential!) -> Void in
            print("got a token.")
        }, failure: { (error: NSError!) -> Void in
            print(error)
        })*/
        
        twitterClient?.deauthorize()
        
        twitterClient?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: nil, scope: nil, success: { (requestToken: BDBOAuth1Credential?) -> Void in
            print("got a token")
            print(requestToken?.token)
            //let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken?.token)") as! URL
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken?.token)")!
            print(url)
            
            UIApplication.shared.openURL(url as URL)
            
        }, failure: { (error)  in
            print(error)
        })
        
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
