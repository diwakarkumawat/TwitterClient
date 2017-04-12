//
//  User.swift
//  TwitterClient
//
//  Created by Kumawat, Diwakar on 4/11/17.
//  Copyright © 2017 Kumawat, Diwakar. All rights reserved.
//

import UIKit

class User: NSObject {
    
    var name: NSString?
    var screenName: NSString?
    var profileImageUrl: NSURL?
    var tagline: NSString?
    var userDict: NSDictionary
    
    init(dict: NSDictionary) {
        self.userDict = dict
        name = dict["name"] as? String as NSString?
        screenName = dict["screen_name"] as? NSString
        tagline = dict["description"] as? NSString
        let profileUrl = dict["profile_image_url_https"] as? NSString
        if let profileUrlString = profileUrl {
            profileImageUrl = URL(string: profileUrlString as String) as NSURL?
        }
    }
    
    static var _currentUser: User?
    
    class var currentUser: User? {
        get {
            
            if _currentUser == nil {
                let defaults = UserDefaults.standard
                let userData = defaults.object(forKey: "currentUserData") as? NSData

                if let userData = userData {
                    let dictionary = try! JSONSerialization.jsonObject(with: userData as Data, options: []) as! NSDictionary
                    _currentUser = User(dict: dictionary)
                }
                return _currentUser
            }
            return nil
        }
        
        set(user) {
            _currentUser = user
            let defaults = UserDefaults.standard
            
            if let user = user {
                let data = try! JSONSerialization.data(withJSONObject: user.userDict, options: [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.set(nil, forKey: "currentUserData")
            }
            
            defaults.synchronize()

        }
    }
}
