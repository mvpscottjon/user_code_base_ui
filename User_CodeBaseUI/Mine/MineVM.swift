//
//  MineVM.swift
//  User_CodeBaseUI
//
//  Created by Seven on 2021/9/24.
//

import UIKit
import Bond
class MineVM: NSObject {

    
    var obUser =  Observable<UserDetailSubVM?>(nil)
    
    override init() {
        super.init()
        self.loadMyUserData()

    }
    
}

extension MineVM {
    
    
    func loadMyUserData(){
        
        
        UserService.shared.getUser(login: "mvpscottjon", completion: {obj, err in
            
            
            DispatchQueue.main.async {
                self.obUser.value = UserDetailSubVM(user: obj)

            }
            
            
        })
        
        
    }
    
    
}
