//
//  Log.swift
//  UniContact
//
//  Created by Burak on 22.05.2021.
//  Copyright © 2021 unicontact. All rights reserved.
//

import Foundation
class Log{
    
    
    static func info(key:String, value:String?){
        print(""+key+":"+value!)
    }
    
    static func info(key:String, value:Int64?){
        print(""+key+":",value!)
    }
    
    static func info(key:String, value:Int?){
        print(""+key+":",value!)
    }
    
}
