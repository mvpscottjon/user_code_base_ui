//
//  UserListVC.swift
//  User_CodeBaseUI
//
//  Created by Seven on 2021/9/24.
//

import UIKit
import SnapKit
class UserListVC: UIViewController {

    var tbView = UITableView(frame: .zero)
    
    var vm = UserListVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        creatUI()
        bindUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        self.navigationController?.navigationBar.barStyle = .black

    }
    
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        return .lightContent
//    }
 
    
       override var preferredStatusBarStyle: UIStatusBarStyle{
           
           return .lightContent
       }

}

extension UserListVC{
    
    func creatUI(){
        self.view.backgroundColor = .gray
//        self.navigationItem.title = "Github"
        
        
        
        let btnBarItem = UIBarButtonItem(title: "Github", style: .done, target: self, action: nil)
        btnBarItem.tintColor = .white
        self.navigationItem.leftBarButtonItem = btnBarItem
        
        self.setupTbView()
        
    }
    
    func bindUI(){
        
        
        
        _ = self.vm.isDataChanged.observeNext(with: {[weak self] in
            guard $0 else {return}
            
            DispatchQueue.main.async {
                self?.tbView.reloadData()
            }
            
        })
       _ =  self.tbView.reactive.selectedRowIndexPath.observeNext(with: { [weak self] idx in
            
//            print("點囉",idx)
            
          let user = self?.vm.users[idx.row]
           
            let vc = UserDetailVC(user: user)
//            vc.modalPresentationStyle = .fullScreen
            
            
            self?.navigationController?.present(vc, animated: true, completion: nil)
            
            
            
        })
        
    }
    
    
    
}

extension UserListVC{

    func setupTbView(){
        
        tbView.dataSource  = self
        tbView.delegate = self
        tbView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.cellID)
        tbView.register(ListTbCell.self, forCellReuseIdentifier: ListTbCell.cellID)

        
        
        self.view.addSubview(tbView)
        
        tbView.snp.makeConstraints({
            $0.edges.equalToSuperview()
            
        })
        
    }

}

extension UserListVC:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.vm.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTbCell.cellID, for: indexPath) as! ListTbCell
        
        cell.cellVM = self.vm.users[indexPath.row]
        
        
        
        
        return cell
    }
    
    
    
    
}
extension UserListVC:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}


extension UserListVC {
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let frameHeight = scrollView.frame.size.height
//        print("contnetH:",contentHeight, "frameH:",frameHeight)
        
        
//        print("absH \(abs(contentHeight - frameHeight))")
        
        
//        print("開始滑動",offsetY)
//        print("==========")
        if offsetY >= 0 && offsetY > abs(contentHeight - frameHeight) {
            
//            guard self.vm._isFirstTimeLoaded == false else {
////                print("第一次讀哦")
//                return
//            }
//            print("到底了哦")

            
            guard self.vm.isLoadingPage == false  else {
//                print("鎖住哦")
                return
            }
            
//            print("讀more")
            
//            self.vm.isLoading.value = true
                
         
            self.vm.loadMoreUserList()
        }
        
        
    }
    
    
    
    
}
