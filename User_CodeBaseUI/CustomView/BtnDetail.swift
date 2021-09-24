//
//  BtnDetail.swift
//  User_CodeBaseUI
//
//  Created by Seven on 2021/9/24.
//

import UIKit

class BtnDetail: UIButton {


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override var intrinsicContentSize: CGSize {
//        let imageViewWidth = imageView?.frame.width ?? 0.0
//        let labelSize = titleLabel?.sizeThatFits(CGSize(width: frame.width, height: .greatestFiniteMagnitude)) ?? .zero
//        let desiredButtonSize = CGSize(width: labelSize.width + titleEdgeInsets.left + titleEdgeInsets.right + imageViewWidth, height: labelSize.height + titleEdgeInsets.top + titleEdgeInsets.bottom)
//        
//        return desiredButtonSize
//    }
    
    
}


extension BtnDetail {
    
    private func setupView(){
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20)
//        self.backgroundColor = .red
        self.contentHorizontalAlignment = .leading
        self.titleLabel?.adjustsFontSizeToFitWidth = false
        self.titleLabel?.lineBreakMode = .byWordWrapping
//        self.titleLabel?.numberOfLines = 1
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
    }
    
    
    
    
}
