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
    
    func homeTimeline() {
        
    }
}
