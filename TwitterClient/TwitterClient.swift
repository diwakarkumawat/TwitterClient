//
//  TwitterClient.swift
//  TwitterClient
//
//  Created by Kumawat, Diwakar on 4/12/17.
//  Copyright © 2017 Kumawat, Diwakar. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {

    static let sharedInstance = TwitterClient(baseURL: NSURL(string: "https://api.twitter.com")! as URL!, consumerKey: "7ecFpPfPSBNWBXUN5FJcYSsuM", consumerSecret: "eyKr9IeYmpRrGBMivlnd66Cvy0mESsGJt8DURBJlR2ZTdSfU3f")
    
    var loginSuccess: (() -> ())?
    var loginFailure: ((Error) -> ())?
    
    func handleOpenUrl(url: NSURL) {
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        
        fetchAccessToken(withPath: "oauth/access_token", method: "POST", requestToken: requestToken, success: { (requestToken: BDBOAuth1Credential?) -> Void in
            print("got access token")
            
            
            /*
            client?.homeTimeline(success: { (tweets: [Tweet]) in
                for tweet in tweets {
                    print(tweet.text!)
                }
            }, failure: { (error: Error) in
                print(error)
            })
            
            
            client?.currentAccount()
            */
            
            self.loginSuccess?()
            
            
        }, failure: { (error: Error?) -> Void in
            print(error)
            self.loginFailure?(error!)
        })
        
    }
    
    func login(success: @escaping () -> (), failure: @escaping (Error) -> ()) {
        
        loginSuccess = success
        loginFailure = failure
        
        deauthorize()
        fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: NSURL(string: "twitterdemo://oauth") as! URL, scope: nil, success: { (requestToken: BDBOAuth1Credential?) -> Void in
            print("got a token")
            print(requestToken?.token)
            //let url = NSURL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(requestToken?.token)") as! URL
            let token = requestToken?.token!
            let urlString = "https://api.twitter.com/oauth/authorize?oauth_token=\(token!)"
            print(urlString)
            let url = NSURL(string: urlString)!
            print(url)
            
            UIApplication.shared.openURL(url as URL)
            
        }, failure: { (error: Error?)  in
            print(error)
            self.loginFailure?(error!)
        })
        
        
    }
    
    func homeTimeline(success: @escaping ([Tweet]) -> (), failure: @escaping (Error) -> ()) {
        
        get("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response:Any?) in
            let dicts = response as! [NSDictionary]
            
            let tweets = Tweet.tweetsWithArray(dicts: dicts)

            success(tweets)
            
        }, failure: { (task:URLSessionDataTask?, error:Error) in
            failure(error)
        })
    }
    
    func currentAccount() {
        TwitterClient.sharedInstance?.get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response:Any?) in
            print("account: \(response)")
            let userDict = response as? NSDictionary
            
            let user = User(dict: userDict!)
            
            print("name: \(user.name)")
            print("screenname: \(user.screenName)")
            print("profileUrl: \(user.profileImageUrl)")
            print("description: \(user.tagline)")
            
        }, failure: { (task:URLSessionDataTask?, error:Error) in
            print(error)
        })
        
    }
}
