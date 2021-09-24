//
//  UserListModel.swift
//  UserSwiftUI
//
//  Created by Seven on 2021/9/23.
//

import Foundation

struct UserListModel:Codable,Identifiable{
    
    let id:Int?
    let login:String?
    let url:String?
    let followers_url:String?
    let following_url:String?
    let type:String?
    let avatar_url:String?

    
}


struct UserDetailModel:Codable{
    
    let id:Int?
    let login:String?

    let name:String?
    let type:String?
    let company:String?
    let location:String?
    let email:String?

    let followers:Int?

    let following:Int?

    let html_url:String?
    let blog:String?

    let avatar_url:String?
    
}
