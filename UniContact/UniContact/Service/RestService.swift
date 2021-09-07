//
//  AuthService.swift
//  UniContact
//
//  Created by Burak on 22.05.2021.
//  Copyright © 2021 unicontact. All rights reserved.
//

/**
 
 Class RestApiService
 
 @idea -> To provide a way to transmit datas between apiManager and other structures, also to prepare a request object for apiManager via request service.
 
 @tasks -> Creating a request object via Request service by sending api url.
           Setting request object.
           Getting Data from other structures via RestProtocol and then setting request body.
           Sending request object apiManager and starting the task.
           Getting Data, URLResponse and Error variables from apiManager via binding.
           Sending Data, URLResponse and Error to ResponseService.
           Returning ResponseService results(Data?,HttpResponse,[String]?) to other structures via RestProtocol.
 
 @data trasmit type -> RestProtocol.setResponses(Data, HttpResponse, [String])
 
 @questions -> How to get variables that have Data type, from other structures
               for request service and api manager? -> via Rest Protocol
               How to set API URL variable in different situation? -> via inheritance

 // tODO: Verileri sadece kalıtım yapan sınıflara açmak.
 
**/

import Foundation
import SwiftyJSON
class RestService{
    
    
    private var restProtocol:RestProtocol
    
    private var restApiManager: RestApiManager?
    
    private var requestService:RequestService?
    
    private var responseService:ResponseService?
    
    private var data:Data?
    
    private var error: Error?
    
    private var response: URLResponse?
    
    
    init(restProtocol:RestProtocol){
        
        Log.info(key: "Class RestApiService", value: "is Begun")
        
        self.restProtocol = restProtocol
        
        
    }
    
    func startService(){
        
        Log.info(key: "Func startService", value: "is Begun")
        
        restApiManager!.startTask()
    }
    
    func stopService(){
        
        Log.info(key: "Func stopService", value: "is Begun")
        
        restApiManager!.stopTask()
    }
    
    private func setRequestService(url:String){
        
        self.requestService = RequestService(apiURL: url)
        
    }
    
    private func setRequestBody(body:Data?){
        
         self.requestService!.setBody(body: body)
    }
    
    private func setRequestAuthorization(value:String?){
        
        self.requestService!.setAuthorization(value: value)
    }
    
    private func setRequestMethod(value:String){
        
        self.requestService!.setHTTPMethod(value: value)
    }
    
    private func setRestApiManager(){
        
        self.restApiManager = RestApiManager(request: self.requestService!.getRequest())
    }
    
    
    private func setRestApiManagerBinding(){
        
        restApiManager!.bindManager = {
            
            // Binding
            
            self.data = self.restApiManager!.data
            
            self.response = self.restApiManager!.response
            
            self.error = self.restApiManager!.error
            
            // After receiving variables, set response service
            
            self.setResponseService()
            
            // Then send return variables to other structures
            
            self.transmitVariables()
        
        }
        
    }
    
    private func setResponseService(){
        
        self.responseService = ResponseService(data:self.data, response:self.response!, error:self.error)
        
    }
    
    private func transmitVariables(){
        
        let responseData = self.responseService?.getData()!
        
        let errors = self.responseService?.getErrors()
        
        let httpResponse = self.responseService?.getHttpResponse()
        
        self.restProtocol.setAPIResponse(data: responseData, httpResponse: httpResponse!, errors: errors)
        
        
        
    }
    
    
}

