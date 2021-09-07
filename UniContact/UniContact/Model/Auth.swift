//
//  Credential.swift
//  UniContact
//
//  Created by Burak on 22.05.2021.
//  Copyright © 2021 unicontact. All rights reserved.
//

import Foundation
struct Auth:Codable{
    
    var username:String
    var password:String
    
    init(username:String, password:String){
        
        self.username = username
        self.password = password
    }
    
    
}
