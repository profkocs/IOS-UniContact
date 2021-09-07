//
//  RestResponseService.swift
//  UniContact
//
//  Created by Burak on 23.05.2021.
//  Copyright © 2021 unicontact. All rights reserved.
//

/**
 
 Class ResponseService
 
 @idea -> To process response variables(data, response, error).
 
 @tasks -> Converting URLResponse to HttpResponse.
           Cheking status code to determine next process.
           Extracting client errors from data.
           Setting external errors.
 
 @data trasmit type -> Data, HttpResponse, [String]
 
 
**/


import Foundation
import SwiftyJSON

class ResponseService{
    
    
    private var response:URLResponse
    
    var data:Data?
    
    private var error:Error?
    
    private var httpResponse:HTTPURLResponse?
    
    private var errors:[String]?
    
    init(data:Data?, response:URLResponse, error:Error?){
        
        Log.info(key: "Class ResponseService", value: "is Begun")
        
        self.response = response
        self.data = data
        self.error = error
        
        setHttpResponse()
        
        checkStatusCode()
    
    }
    
    private func setHttpResponse(){
        
        self.httpResponse = response as? HTTPURLResponse
        
    }
    
   
    func getHttpResponse()->HTTPURLResponse{
        
        return self.httpResponse!
        
    }
    
    func getStatusCode()->Int?{
        
        return self.httpResponse?.statusCode
    }
    
    func getData()->Data?{
        
        return self.data
    }
    
    func getErrors()->[String]?{
        
        return self.errors
    }
    
    
    private func checkStatusCode(){
        
        Log.info(key: "Response Status Code:", value: self.httpResponse?.statusCode )
        
        if((400...499).contains(((self.httpResponse?.statusCode)!))){
            
            Log.info(key: "Error Type:", value: "Client Error")
            
            // Client Errors
            extractErrors()
            
            
        } else if((500...599).contains((self.httpResponse?.statusCode)!)){
            
            Log.info(key: "Error Type:", value: "Server Error")
            
            // Server Errors
            setExternalError()
            writeLocalizedDescription()
            writeDebugDescription()
            
        }
        
        
    }
    
    
    private func extractErrors(){
        
        // get errors from data
        let json = JSON(self.data)
        
        let errors = json[ApiKeys.errors.rawValue]
        
        for error in errors{

            let message = error.1[ApiKeys.message.rawValue].stringValue
            self.errors?.append(message)
            writeErrorToTerminal(message: message)
        }
        
        self.data = nil
        
    }
    
    private func writeErrorToTerminal(message:String){
        
        Log.info(key: "Client Error Message:", value: message)
    }
    
    
    private func setExternalError(){
        
        // add localized string
        
        self.errors?.append("Something went wrong")
        
    }
    
    private func writeLocalizedDescription(){
        
        Log.info(key: "External Error Local Description", value: self.error?.localizedDescription)
    }
    
    private func writeDebugDescription(){
        
        Log.info(key: "External Error Debug Description", value: self.error.debugDescription)
    }
    
    
  
}
