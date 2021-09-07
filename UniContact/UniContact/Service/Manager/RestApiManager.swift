//
//  ApiManager.swift
//  UniContact
//
//  Created by Burak on 21.05.2021.
//  Copyright © 2021 unicontact. All rights reserved.
//


/**

 Class RestApiManager
 
 @idea -> Providing a communiacation between API server and client classes.
 @tasks ->  Sending a request to the server.
            Observing a response from the server.
            Transmitting the response by using binding.
 
 @public variables -> data:Data, response:URLResponse, error:Error, bindManager = {}
 @public metods -> startTask, stopTask
 @dependency -> URLRequest, URLSessionDataTask
 @trasmit type -> Binding
 @data trasnmit type -> Data, URLResponse, Error
 
 
 @questions -> Which structure creates the request? -> Request Service
               Which structure gets the data, response and error from there? -> Rest Service
 
 **/


import Foundation

class RestApiManager{
    
    
    private var task: URLSessionDataTask?
    
    private var request: URLRequest
    
    // Public Variables
    
    var data: Data?{
        
        didSet{
            
            // Binding
            self.bindManager()
        }
    }
    
    var response: URLResponse?
    
    var error: Error?
    
    // Binding ApiManager From Services
    var bindManager: (()->()) = {}
    

    init(request:URLRequest){
        
        Log.info(key: "Class ApiManager", value: "is Begun")
        
        self.request = request
    }
    
    
    func stopTask(){
        
        Log.info(key: "Func stopTask", value: "is Begun")
        
        task!.cancel()
    }
    
    func startTask(){
        
        Log.info(key: "Func startTask", value: "is Begun")
        
        task =  URLSession.shared.dataTask(with:request) { (data, response, error) in
            
            Log.info(key: "Info task", value: "is Done")
            
            self.setData(data: data)
            self.setError(error: error)
            self.setResponse(response: response!)
        }
        
        task!.resume()
    }
    
   
    private func setData(data:Data?){
        
        self.data = data
    }
    
    private func setError(error:Error?){
        
        self.error = error
    }
    
    private func setResponse(response:URLResponse){
        
        self.response = response
    }
    
}
