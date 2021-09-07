//
//  Token.swift
//  UniContact
//
//  Created by Burak on 22.05.2021.
//  Copyright © 2021 unicontact. All rights reserved.
//

/**
 Class Responsibility -> Setting Value To All Token Class Variables.
*/

import Foundation
struct Token:Codable{
    
    
    var user_id:String?
    var accessToken:String?
    var accessTokenExpiration:String?
    var refreshToken:String?
    var refreshTokenExpiration:String?
    
    
    init(user_id:String, accessToken:String, accessTokenExpiration:String, refreshToken:String, refreshTokenExpiration:String){
        
        self.user_id = user_id
        self.accessToken = accessToken
        self.accessTokenExpiration = accessTokenExpiration
        self.refreshToken = refreshToken
        self.refreshTokenExpiration = refreshTokenExpiration
        
    }
    
    
    
    
    
    
}
