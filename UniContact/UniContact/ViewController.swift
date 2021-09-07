//
//  ViewController.swift
//  UniContact
//
//  Created by Burak on 21.05.2021.
//  Copyright © 2021 unicontact. All rights reserved.
//


/**
 Class Responsibility -> Checking token to determine direction (SigninScreen or HomeScreen)
*/

import UIKit

class ViewController: UIViewController {

    /*
    var tokenViewModel = TokenViewModel(token: nil)
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        Log.info(key: "Class ViewController", value: "is Begun")
        
        determineDirection()
    }
    
    
    private func determineDirection(){
        
        Log.info(key: "Func determineDirection",value: "is Begun")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            if (self.tokenViewModel.tokenModel != nil) {
                
                self.showHomeScreen()
                
            } else{
                
                self.showSigninScreen()
            }
            
        }
        
    }
    
    // Segues
    
    private func showHomeScreen(){
        
        Log.info(key: "Func showHomeScreen",value: "is Begun")
        self.performSegue(withIdentifier: SegueKeys.splash_to_home.rawValue, sender: nil)
    }
    
    private func showSigninScreen(){
        
        Log.info(key: "Func showSigninScreen",value: "is Begun")
        self.performSegue(withIdentifier: SegueKeys.splash_to_signin.rawValue, sender: nil)
    }
    
*/

}

