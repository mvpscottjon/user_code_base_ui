//
//  MineVC.swift
//  User_CodeBaseUI
//
//  Created by Seven on 2021/9/24.
//

import UIKit

class MineVC: UIViewController {

    lazy var mineView = MineView()

    var vm = MineVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatUI()
        bindUI()
    }
    

}


extension MineVC{
    
    func creatUI(){
        self.view.backgroundColor = .white
        
        
        let btnBarItem = UIBarButtonItem(title: "Github", style: .done, target: self, action: nil)
        btnBarItem.tintColor = .white
        self.navigationItem.leftBarButtonItem = btnBarItem
        self.setupView()
    }
    
    func bindUI(){
        
        
       _ = self.vm.obUser.observeNext(with: {[weak self] subVM in
            
            
            self?.mineView.subVM = subVM
            
        })
        
    }
    
    
    
}
extension MineVC{
    
    private func setupView(){
        
        self.view.addSubview(mineView)
        
        mineView.snp.makeConstraints({
            $0.edges.equalTo(self.view.safeAreaLayoutGuide)
            
        })
        
    }
    
    
}
