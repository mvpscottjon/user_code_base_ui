//
//  MineView.swift
//  User_CodeBaseUI
//
//  Created by Seven on 2021/9/24.
//

import UIKit
import Kingfisher
class MineView: UIView {

    var cover = UIView()

    var imgViewGit = UIImageView()

    var lbGit = UILabel()

//    var btnGit = UIButton()
    
    
    
    var imgUser = UIImageView()
    
    
    var lbFullName = UILabel()
    var lbLogin = UILabel()

    
    
    
    
    
    var btnFollow = BtnDetail()
    var btnEmail = BtnDetail()
    
    
    let coverColor = UIColor.init(red: 0.02263874933, green: 0.1448459029, blue: 0.2967996299, alpha: 1)
    
    
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
        
        self.imgViewGit.layer.cornerRadius = self.imgViewGit.frame.width / 2
        self.imgUser.layer.cornerRadius = self.imgUser.frame.width / 2
    }
    

}

extension MineView{
    
    
    private func setupView(){
        
        cover.backgroundColor = coverColor
        self.addSubview(cover)
        
        cover.snp.makeConstraints({
            
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        })
        
//        btnGit.imageView?.contentMode = .scaleAspectFit
//        btnGit.setImage(UIImage(named: "git"), for: .normal)
//        btnGit.setTitle("GitHub Docs", for: .normal)
//        btnGit.setTitleColor(.white, for: .normal)
//
//
//        self.cover.addSubview(btnGit)
//
//        btnGit.snp.makeConstraints({
//
//            $0.center.equalToSuperview()
//
//            $0.width.equalToSuperview().inset(50)
//            $0.height.equalToSuperview().multipliedBy(0.5)
//
//        })
        
        
        let gitImg = UIImage(named: "git")
        gitImg?.withRenderingMode(.alwaysTemplate)

//        gitImg?.withTintColor(coverColor)
        
//        imgViewGit.backgroundColor = .yellow
        imgViewGit.tintColor = coverColor
        imgViewGit.image = gitImg
        imgViewGit.contentMode = .scaleAspectFit
        imgViewGit.clipsToBounds = true
        imgViewGit.layer.masksToBounds = true
        self.cover.addSubview(imgViewGit)
        
        imgViewGit.snp.makeConstraints({
            
            $0.leading.equalToSuperview().offset(70)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(60)
           
            
        })
        
        lbGit.text = "GitHub Docs"
        lbGit.textColor = .white
        lbGit.font = UIFont.boldSystemFont(ofSize: 30)
        self.cover.addSubview(lbGit)
        
        lbGit.snp.makeConstraints({
            
            $0.leading.equalTo(imgViewGit.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
           
            
        })
        
        
        
        
        
        
        
//        imgUser.backgroundColor = .yellow
        imgUser.image = .defaultPhoto
        imgUser.contentMode = .scaleAspectFill
        imgUser.clipsToBounds = true
        imgUser.layer.masksToBounds = true
        self.addSubview(imgUser)
        imgUser.snp.makeConstraints({
            $0.leading.equalToSuperview().offset(60)
            $0.centerY.equalTo(cover.snp.bottom)
            $0.width.height.equalTo(70)
            
        })
        
//        lbFullName.text = "Name"
        lbFullName.font = UIFont.boldSystemFont(ofSize: 20)
        self.addSubview(lbFullName)
        lbFullName.snp.makeConstraints({
            $0.top.equalTo(imgUser.snp.bottom).offset(30)
            $0.leading.equalTo(imgUser)
            $0.trailing.equalToSuperview().offset(-60)
            
            
        })
        
        
//        lbLogin.text = "Login"
        lbLogin.font = UIFont.systemFont(ofSize: 13)
        lbLogin.textColor = .lightGray
        self.addSubview(lbLogin)
        lbLogin.snp.makeConstraints({
            $0.top.equalTo(lbFullName.snp.bottom).offset(10)
            $0.leading.equalTo(lbFullName)
            $0.trailing.equalToSuperview().offset(-60)
            
            
        })
        
        
        btnFollow.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)
        
        btnFollow.imageView?.contentMode = .scaleAspectFit
        btnFollow.setImage(UIImage(systemName: "person.2")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnFollow.setTitle("Follow", for: .normal)
        btnFollow.setTitleColor(.lightGray, for: .normal)
        btnFollow.tintColor = .black
        
        
        
        self.addSubview(btnFollow)
        btnFollow.snp.makeConstraints({
            $0.top.equalTo(lbLogin.snp.bottom).offset(20)
            $0.leading.equalTo(lbFullName)
//            $0.trailing.equalToSuperview().offset(-60)
            
            
        })
        
        
        btnEmail.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: -5)

        btnEmail.imageView?.contentMode = .scaleAspectFit
        btnEmail.setImage(UIImage(systemName: "envelope")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btnEmail.setTitle("", for: .normal)
        btnEmail.setTitleColor(.lightGray, for: .normal)
        btnEmail.tintColor = .black
        
        
        
        self.addSubview(btnEmail)
        btnEmail.snp.makeConstraints({
            $0.top.equalTo(btnFollow.snp.bottom).offset(20)
            $0.leading.equalTo(lbFullName)
//            $0.trailing.equalToSuperview().offset(-60)
            
            
        })
        
        
        
        
    
    }
}




extension MineView{
    
    private func updateView(){
        
        
        self.imgUser.kf.setImage(with: subVM?.userPhotoURL, placeholder: UIImage.defaultPhoto)
        self.lbFullName.text = subVM?.fullName
        self.lbLogin.text = subVM?.login
        
        self.btnFollow.setAttributedTitle(subVM?.followAttrString, for: .normal)
//        self.btnEmail.setTitle(subVM?.email, for: .normal)
        
    }
    
}
