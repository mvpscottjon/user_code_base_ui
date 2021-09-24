//
//  UserDetailVM.swift
//  User_CodeBaseUI
//
//  Created by Seven on 2021/9/24.
//

import UIKit
import Bond

class UserDetailVM: NSObject {

    
    var obUserDetail = Observable<UserDetailSubVM?>(nil)
    
    
    override init() {
        super.init()
        
        
        
    }
}




extension UserDetailVM{
    
    func loadUserDetail(login:String?){
        
//        print("跑loadUserDetail," , login)
        
        UserService.shared.getUser(login: login, completion: { obj, err in
            
            guard err == nil else {return}
            
            
//            print("回來了哦",obj)
            
            DispatchQueue.main.async {
                self.obUserDetail.value = UserDetailSubVM(user: obj)

            }
            
        })
        
        
    }
    
    
}

