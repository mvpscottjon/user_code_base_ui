//
//  Constants.swift
//  User_CodeBaseUI
//
//  Created by Seven on 2021/9/24.
//

import UIKit

//class Constants: NSObject {
//
//
//
//}


struct Constants {
    
    
}


extension UIImage {
    
    static let defaultPhoto = UIImage(systemName: "photo")
    
    
}



extension UITableViewCell {
    static var cellID : String {
        
        
        return String(describing: self)
        
        
    }
    
}




extension Numeric {
    
    
    func toString() -> String? {
        
        return "\(self)"
        
        
    }
    
}


extension String{
    
    func toURL() -> URL?{
        
        
        
       return URL(string: self)
        
        
    }
    
 
    
}
