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
    
    init(dict: NSDictionary) {
        name = dict["name"] as? String as NSString?
        screenName = dict["screen_name"] as? NSString
        tagline = dict["description"] as? NSString
        let profileUrl = dict["profile_image_url_https"] as? NSString
        if let profileUrlString = profileUrl {
            profileImageUrl = URL(string: profileUrlString as String) as NSURL?
        }
    }
}
