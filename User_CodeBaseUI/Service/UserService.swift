//
//  UserService.swift
//  UserSwiftUI
//．
//  Created by Seven on 2021/9/22.
//

import Foundation
import Alamofire

class UserService :NSObject{
    
    static let shared = UserService()
    
    var baseHeader = HTTPHeaders(["Accept":"application/vnd.github.v3+json", "Content-Type":"application/json;charset=utf-8"])
   
    
    public enum ServiceError:Error{
        
        case noParameters
        case noData
        case jsonDecodeFailed
        case urlFailed
        
    }
    
    private override init() {
        
    }
    
    
    
    
}

extension UserService {
    
    func getUserList(per_page:Int,since:Int,completion: @escaping([UserListModel]?,Error?) -> Void){
        
//        guard let token = token  else {
//
//            completion(nil,ServiceError.noParameters)
//
//            return}
        
        
        
        
//        var header = baseHeader
//        header.add(name: "Accept", value: "application/vnd.github.v3+json")
//        header.add(name: "Content-Type", value: "application/json;charset=utf-8")
//        header.add(name: "Authorization", value: "token \(token)")

        
        var component = URLComponents(string: "https://api.github.com/users")

        
        let per_pageItem = URLQueryItem(name: "per_page", value: "\(per_page)")
        let sinceItem = URLQueryItem(name: "since", value: "\(since)")
        
        
        component?.queryItems = [per_pageItem, sinceItem]
        
       
        
        guard let url = component?.url else{
            
            completion(nil,ServiceError.urlFailed)

            
            return}

        var req =  URLRequest(url: url)
        req.headers = baseHeader
        req.method = .get
        
        URLSession.shared.dataTask(with: req, completionHandler: {data, response, err in
            
            guard let data = data else {
                
                completion(nil,ServiceError.noData)

                return}
            
//            let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
//            print("看json:",json)
            
            guard let arr = try? JSONDecoder().decode([UserListModel].self, from: data) else {
                
//                print("解失敗")
                completion(nil,ServiceError.jsonDecodeFailed)

                return}
            
            
//            print("解完",arr.count)
            
            
            completion(arr,nil)
            
            
            
        }).resume()
        
        
    }
    
    
    func getUser(login:String?, completion: @escaping((UserDetailModel?,Error?) -> Void)){
        
        
//        print("開始跑getUSer:",login)
        
        guard let login = login  else {
            
//            print("沒有token or login", login as Any, token as Any)
            
            completion(nil,ServiceError.noParameters)

            return}
        
        
        
        let component = URLComponents(string: "https://api.github.com/users/\(login)")

//        var header = baseHeader
//        header.add(name: "Accept", value: "application/vnd.github.v3+json")
//        header.add(name: "Content-Type", value: "application/json;charset=utf-8")
//        header.add(name: "Authorization", value: "token \(token)")

        guard let url = component?.url else {
            completion(nil,ServiceError.urlFailed)

            return}
        
        var req =  URLRequest(url: url)
        req.headers = baseHeader
        req.method = .get
        
        URLSession.shared.dataTask(with: req, completionHandler: {data, response, err in
            
            guard let data = data else {
                print("沒有data",err as Any)
                completion(nil,ServiceError.noData)

                return}
            

            
            guard let obj = try? JSONDecoder().decode(UserDetailModel.self, from: data) else {
                
                print("解失敗")
                completion(nil,ServiceError.jsonDecodeFailed)

                return}
            
//                                print("解完",obj)
                    
            completion(obj,nil)
            
            
            
        }).resume()
        
        
        
    }
    
    
//
//
//    func getMineUserData(token:String?, completion: @escaping((UserDetailModel?,Error?) -> Void)){
//
//
////        print("開始跑getUSer:",login)
//
//        guard let token = token  else {
//
//            print("沒有token")
//
//            completion(nil,ServiceError.noParameters)
//
//            return}
//
//
//
//        let component = URLComponents(string: "https://api.github.com/user/")
//
//        var header = baseHeader
////   34
//        header.add(name: "Authorization", value: "token \(token)")
//
//        guard let url = component?.url else {
//            completion(nil,ServiceError.urlFailed)
//
//            return}
//
//        var req =  URLRequest(url: url)
//        req.headers = header
//        req.method = .get
//
//        URLSession.shared.dataTask(with: req, completionHandler: {data, response, err in
//
//            guard let data = data else {
//                print("沒有data",err as Any)
//                completion(nil,ServiceError.noData)
//
//                return}
//
//
//
//            guard let obj = try? JSONDecoder().decode(UserDetailModel.self, from: data) else {
//
//                print("解失敗")
//                completion(nil,ServiceError.jsonDecodeFailed)
//
//                return}
//
////                                print("解完",obj)
//
//            completion(obj,nil)
//
//
//
//        }).resume()
//
//
//
//    }
//
    
    
    
    
}


