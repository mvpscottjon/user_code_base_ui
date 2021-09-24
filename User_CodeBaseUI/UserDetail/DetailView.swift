//
//  DetailView.swift
//  User_CodeBaseUI
//
//  Created by Seven on 2021/9/24.
//

import UIKit

class DetailView: UIView {

    
    var btnClose = UIButton()
    
    var imgUser = UIImageView()
    
    var lbFullName = UILabel()
    
    
    
    var btnLogin = BtnDetail()
    var btnLocation = BtnDetail()
    var btnLink = BtnDetail()
//    var imgLogin = UIImageView()
//
//    var lbLogin = UILabel()
//
//    var lbLocation = UILabel()
//
//    var lbLink = UILabel()
    
    
    var subVM:UserDetailSubVM?{
        
        didSet{
            self.updateView()
        }
        
        
        
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.imgUser.layer.cornerRadius = self.imgUser.frame.width / 2
    }
    
}

extension DetailView{
    
    private func setupView(){
        
//        btnClose.backgroundColor = .red
        btnClose.setImage(UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnClose.tintColor = .black
        self.addSubview(btnClose)
        
        btnClose.snp.makeConstraints({
            $0.top.equalToSuperview().offset(30)
            $0.leading.equalToSuperview().offset(40)
            $0.width.height.equalTo(40)
            
        })
        
        
        imgUser.image = .defaultPhoto
        imgUser.contentMode = .scaleAspectFill
        imgUser.clipsToBounds = true
        imgUser.layer.masksToBounds = true
        self.addSubview(imgUser)
        
        imgUser.snp.makeConstraints({
            $0.top.equalTo(btnClose.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(100)
            
        })
        
        
//        lbFullName.text = ""
        self.addSubview(lbFullName)
        
        lbFullName.snp.makeConstraints({
            $0.top.equalTo(imgUser.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.lessThanOrEqualTo(self).inset(10)
            
        })
        
        
        
        let border = UIView()
        border.backgroundColor = .lightGray
        
        self.addSubview(border)
        border.snp.makeConstraints({
            $0.top.equalTo(lbFullName.snp.bottom).offset(40)
            $0.centerX.width.equalToSuperview()
            $0.height.equalTo(0.7)
            
        })
        
        
        
        btnLogin.setTitle("Name", for: .normal)
        btnLogin.setImage(UIImage(systemName: "person.fill")?.withRenderingMode(.alwaysTemplate).withTintColor(.black), for: .normal)
        btnLogin.setTitleColor(.lightGray, for: .normal)
        
        btnLogin.tintColor = .black

        
        self.addSubview(btnLogin)
        btnLogin.snp.makeConstraints({
            $0.top.equalTo(border.snp.bottom).offset(40)
            $0.leading.equalToSuperview().offset(70)
//            $0.trailing.lessThanOrEqualToSuperview()
            
            $0.trailing.equalToSuperview().inset(10)
            
        })
        
        
        btnLocation.setTitle("Location", for: .normal)
        btnLocation.setImage(UIImage(systemName: "location.fill")?.withRenderingMode(.alwaysTemplate).withTintColor(.black), for: .normal)
        btnLocation.setTitleColor(.lightGray, for: .normal)
        btnLocation.tintColor = .black

        
        
        self.addSubview(btnLocation)
        btnLocation.snp.makeConstraints({
            $0.top.equalTo(btnLogin.snp.bottom).offset(40)
            $0.leading.equalTo(btnLogin)
//            $0.width.lessThanOrEqualTo(self).inset(70)
//            $0.trailing.lessThanOrEqualToSuperview()

            $0.trailing.equalToSuperview().inset(10)

        })
        
        
        
        
        btnLink.setTitle("Link", for: .normal)
        btnLink.setImage(UIImage(systemName: "link")?.withRenderingMode(.alwaysTemplate).withTintColor(.black), for: .normal)
        btnLink.setTitleColor(.lightGray, for: .normal)
        btnLink.tintColor = .black
        
        
        self.addSubview(btnLink)
        btnLink.snp.makeConstraints({
            $0.top.equalTo(btnLocation.snp.bottom).offset(40)
            $0.leading.equalTo(btnLogin)
//            $0.width.lessThanOrEqualTo(self).inset(70)
//            $0.trailing.lessThanOrEqualToSuperview()

            $0.trailing.equalToSuperview().inset(10)

        })
        
        
        
        
        
        
        
    }
    
    
}


extension DetailView{
    
    private func updateView(){
        
        self.lbFullName.text =  self.subVM?.fullName
        
        
        self.btnLogin.setTitle(self.subVM?.login, for: .normal)
        
        self.btnLocation.setTitle(self.subVM?.location, for: .normal)
        
        self.btnLink.setTitle(self.subVM?.link, for: .normal)
        
        
        self.imgUser.kf.setImage(with: self.subVM?.userPhotoURL, placeholder: UIImage.defaultPhoto)
        
        
    }
    
    
}
