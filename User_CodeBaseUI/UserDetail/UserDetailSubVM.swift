//
//  UserDetailSubVM.swift
//  UserSwiftUI
//
//  Created by Seven on 2021/9/24.
//

import Foundation
import UIKit

class UserDetailSubVM:NSObject{
    
    var fullName:String? {
//        print("看一下fullname:",self._user?.name)

        return self._user?.name ?? self._user?.login
    }
    
    var login:String?{
        
//        print("看一下nickname:",self._user?.login)
        
        return self._user?.login
        
    }
    
    var userPhotoURL:URL?{
//        print("看一下 photoUrl :",self._user?.avatar_url?.toURL(), self._user?.avatar_url)
        return self._user?.avatar_url?.toURL()
        
    }
    
    var email:String?{
        
        
        return self._user?.email
    }
    
    
    var location:String?{
        
        return self._user?.location
    }
    
    var link:String?{
        
        return self._user?.html_url ?? self._user?.blog
    }
    
    
    var followAttrString: NSAttributedString?{
        
        let countAttr = [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:UIFont.systemFont(ofSize: 15)]
        
        let strAttr = [NSAttributedString.Key.foregroundColor:UIColor.lightGray, NSAttributedString.Key.font:UIFont.systemFont(ofSize: 14)]

        
        
        let finalAttrString = NSMutableAttributedString()
        
        
        let followerCount = "\(self._user?.followers ?? 0)"
        let followingCount = "\(self._user?.following ?? 0)"

        let attrFollowerCount = NSAttributedString(string: followerCount, attributes: countAttr)
        let attrFollowingCount = NSAttributedString(string: followingCount, attributes: countAttr)

        
        
        
        let doc = " ・ "
        
        let attrDoc = NSAttributedString(string: doc, attributes: strAttr)
        
        
        let followerStr = " followers"
        let followingStr = " followings"
        
        
        let attrFollowerStr = NSAttributedString(string: followerStr, attributes: strAttr)
        let attrFollowingStr = NSAttributedString(string: followingStr, attributes: strAttr)

        
        finalAttrString.append(attrFollowerCount)
        finalAttrString.append(attrFollowerStr)
        finalAttrString.append(attrDoc)
        finalAttrString.append(attrFollowingCount)
        finalAttrString.append(attrFollowingStr)

        
        return finalAttrString
        
    }
    
    var followersCount:String?{
        
        return self._user?.followers?.toString()

    }
    
    var followingCount:String?{
        
        return self._user?.following?.toString()

    }
    
    var type: String? {
        
        
        return self._user?.type
    }
    
    private var _user:UserDetailModel?
    
    init(user:UserDetailModel?){
        
        self._user = user
    }
    
}
