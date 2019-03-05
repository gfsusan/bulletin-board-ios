//
//  Post.swift
//  SimpleBulletinBoard
//
//  Created by Susan Kim on 04/03/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import Foundation

struct Post: Decodable{
    var id:String
    var title:String
    var content:String
    
    init(_ index: String, _ title: String, _ content: String) {
        self.id = index
        self.title = title
        self.content = content
    }
}
