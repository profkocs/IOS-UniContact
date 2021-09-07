//
//  AuthViewModel.swift
//  UniContact
//
//  Created by Burak on 22.05.2021.
//  Copyright © 2021 unicontact. All rights reserved.
//

import Foundation
protocol RestProtocol {
    
    func getEncodedModel()->Data?
    func setAPIResponse(data: Data?, httpResponse:HTTPURLResponse, errors:[String]?)
}
