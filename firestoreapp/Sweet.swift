//
//  Sweet.swift
//  firestoreapp
//
//  Created by Konstantinos Rizos on 18/01/2019.
//  Copyright © 2019 Brian Advent. All rights reserved.
//

import UIKit
import Firestore

protocol DocumentSerializable {
    init?(dictionary:[String:Any])
}

struct Sweet {
    var name:String
    var content:String
    var timeStamp:Date
    
    var dictionary:[String:Any] {
        return [
            "name":name,
            "content":content,
            "timeStamp":timeStamp
        ]
    }
    
}

extension Sweet : DocumentSerializable {
    init?(dictionary:[String:Any]) {
        guard let name = dictionary["name"] as? String,
            let content = dictionary["content"] as? String,
            let timeStamp = dictionary["timeStamp"] as? Date else { return nil }
        
        self.init(name: name, content: content, timeStamp: timeStamp)
        
    }
}
