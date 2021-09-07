//
//  AuthServiceKeys.swift
//  UniContact
//
//  Created by Burak on 22.05.2021.
//  Copyright © 2021 unicontact. All rights reserved.
//

import Foundation
enum AuthServiceKeys:String{
    
    // Common
    case data = "data"
    case error = "error"
    case errors = "errors"
    
    
    // Sign in
    
    case user_id = "user_id"
    case accessToken = "accessToken"
    case accessTokenExpiration = "accessTokenExpiration"
    case refreshToken = "refreshToken"
    case refreshTokenExpiration = "refreshTokenExpiration"
}
