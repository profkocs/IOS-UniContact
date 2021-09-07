//
//  UsernameValidation.swift
//  UniContact
//
//  Created by Burak on 22.05.2021.
//  Copyright © 2021 unicontact. All rights reserved.
//

import Foundation
class UsernameValidator{
    
    private var username:String
    
    init(username:String){
        
        self.username = username
    }
    
    func validateUsername()->String{
        
        if((username.count) == 0 || (username.count) < 3){
            
            return NSLocalizedString("error_invalid_username_characters_length", comment: "")
            
        } else if (!(username.unicodeScalars.first!.value >= 97 && username.unicodeScalars.first!.value <= 122)){
            
            return NSLocalizedString("error_username_first_character", comment: "")
        }
        
        return NSLocalizedString("success", comment: "")
    }
    
}
