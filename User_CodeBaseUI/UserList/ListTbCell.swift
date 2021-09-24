//
//  ListTbCell.swift
//  User_CodeBaseUI
//
//  Created by Seven on 2021/9/24.
//

import UIKit

class ListTbCell: UITableViewCell {

    
    var imgUser = UIImageView(frame: .zero)
    var lbName = UILabel(frame: .zero)
    var lbSubtitle = UILabel(frame: .zero)

    
    var cellVM:UserListModel? {
        
        didSet{
            self.updateCell()
            
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imgUser.layer.cornerRadius = 25
    }

}

extension ListTbCell{
    
    
    private func  setupCell(){
        
        //img
        imgUser.image = UIImage.defaultPhoto
        imgUser.clipsToBounds = true
        imgUser.layer.masksToBounds = true
        imgUser.contentMode = .scaleAspectFill
        self.contentView.addSubview(imgUser)
        
        imgUser.snp.makeConstraints({
            $0.leading.equalToSuperview().offset(30)
            $0.centerY.equalToSuperview()
            $0.size.equalTo(CGSize(width: 50, height: 50))
            
            
        })
        
        
        
        //lbName
        lbName.text = "name"
        self.contentView.addSubview(lbName)
        
        lbName.snp.makeConstraints({
            $0.leading.equalTo(imgUser.snp.trailing).offset(15)
            $0.bottom.equalTo(self.snp.centerY)
            
            
        })
        
        //lbSubtitle
        lbSubtitle.text = "subtitle"
        self.contentView.addSubview(lbSubtitle)
        
        lbSubtitle.snp.makeConstraints({
            $0.leading.equalTo(lbName)
            $0.top.equalTo(self.snp.centerY)
            
            
        })
        
        
        
    }
    
}


extension ListTbCell{
    private func updateCell(){
        
        self.lbName.text = cellVM?.login
        self.lbSubtitle.text = cellVM?.type
        
        self.imgUser.kf.setImage(with: cellVM?.avatar_url?.toURL(), placeholder: UIImage.defaultPhoto)
        
        
    }
    
}
