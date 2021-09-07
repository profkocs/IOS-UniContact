//
//  RequestService.swift
//  UniContact
//
//  Created by Burak on 23.05.2021.
//  Copyright © 2021 unicontact. All rights reserved.
//

/**

 Class RequestService
 
 @idea ->  Creating and setting a request object.
 
 @tasks -> Creating a request object with apiURL.
           Sending request to other structures.
           Setting request contentType, body, authorization.

 @data trasmit type -> URLRequest
 
 @questions -> Which structure sends the requests setting values and
               gets a request object as a result? -> RestService
 
**/
import Foundation

class RequestService {
    
    private var request:URLRequest?
    
    init(apiURL:String){
        
        Log.info(key: "Class RequestService", value: "is Begun")
        
        request = URLRequest(url: URL(string: apiURL)!)
        
        // Default Settings
        setContentType()
    }
    
    func getRequest()->URLRequest{
        
        return self.request!
        
    }
    
    func setContentType(){
        
        request?.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    func setHTTPMethod(value:String){
        
        request?.httpMethod = value
    }
    
    func setBody(body:Data?){
        
        if(body != nil){
            
            Log.info(key: "Info request body", value: "is Set")
            
            self.request?.httpBody = body
        }
       
    }
    
    func setAuthorization(value:String?){
        
        if(value != nil){
            
            Log.info(key: "Info request authorization", value: "is Set")
            
            request?.setValue(value, forHTTPHeaderField: "Authorization")
        }
        
    }
    
    
    
    
}
