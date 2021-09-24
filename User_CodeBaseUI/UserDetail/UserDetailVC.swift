//
//  UserDetailVC.swift
//  User_CodeBaseUI
//
//  Created by Seven on 2021/9/24.
//

import UIKit

class UserDetailVC: UIViewController {

    
    lazy var detailView = DetailView()
    
    var vm = UserDetailVM()
    
    private var _user: UserListModel?
    
    
    init(user:UserListModel?){
        
        super.init(nibName: nil, bundle: nil)
        
        self._user = user
        
        self.vm.loadUserDetail(login: user?.login)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatUI()
        bindUI()
    }
    


}

extension UserDetailVC{
    
    func creatUI(){
        self.view.backgroundColor = .white
        self.setupDetailView()
        
    }
    
    func bindUI(){
        
        _ = self.detailView.btnClose.reactive.tap.observeNext(with: {[weak self] in
            
            self?.dismiss(animated: true, completion: nil)
            
            
        })
        
        _ = self.vm.obUserDetail.observeNext(with: {[weak self] subVM in
            
            self?.detailView.subVM = subVM
            
            
        })
    }
    
    
    
}

extension UserDetailVC{
    
    private func setupDetailView(){
        
        self.view.addSubview(detailView)
        detailView.snp.makeConstraints({$0.edges.equalToSuperview()})
        
    }
    
}
