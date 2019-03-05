//
//  DataCenter.swift
//  SimpleBulletinBoard
//
//  Created by Susan Kim on 04/03/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import Foundation
import Alamofire

let dataCenter = DataCenter()
var counter: Int = 4

class DataCenter {
    let baseURL = "http://hulk.zeyo.co.kr:5002/api/documents"
    var posts:[Post]
    
    init() {
        posts = []
    }
    
    func uploadPost(number: String, title: String, content: String, completionHandler: @escaping () -> Void) {
        Alamofire.request(
            "\(baseURL)",
            method: .post,
            parameters: ["number" : counter, "title" : title, "content" : content],
            encoding: URLEncoding.httpBody,
            headers:nil
        )
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Post unsuccessful.")
                    return
                }
                counter = counter + 1
                completionHandler()
        }
        
    }
    
    func loadPosts(completionHandler: @escaping () -> Void) {
        Alamofire.request(
            baseURL,
            method: .get,
            parameters: [:],
            encoding: URLEncoding.default,
            headers: [:]
            )
            .validate(statusCode: 200..<300)
            .responseJSON {
                response in
                guard response.result.isSuccess else {
                    print("Load unsuccessful.")
                    return
                }
                
                if let result = response.result.value {
                    let JSON = result as! NSArray
                    
                    dataCenter.posts = []
                    for postJSON in JSON {
                        guard let jsonData = postJSON as? Dictionary<String, Any> else {
                            continue
                        }
                        
                        let number = jsonData["number"] as? Int
                        let title = jsonData["title"] as? String
                        let content = jsonData["content"] as? String
                    
                        guard let n = number, let t = title, let c = content else {
                            continue
                        }
                        dataCenter.posts.append(Post(n, t, c))
                    }
                    
                }
                completionHandler()
        }
    }
    
    func deletePost(id:Int, completionHandler: @escaping () -> Void ) {
        Alamofire.request(
            "\(baseURL)/\(id)",
            method: .delete,
            parameters: [:],
            encoding: URLEncoding.httpBody,
            headers:nil
            )
            .validate()
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("Delete unsuccessful.")
                    return
                }
                completionHandler()
        }
    }

}
