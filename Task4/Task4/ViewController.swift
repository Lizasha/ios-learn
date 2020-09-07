//
//  ViewController.swift
//  Task4
//
//  Created by Elizaveta Shabalina on 07.09.2020.
//  Copyright © 2020 Elizaveta Shabalina. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func validateLogin(_ sender: UIButton) {
        LoginField.backgroundColor = nil
        var login = LoginField.text!
        var valid = true
        
        if !(login.contains("@") || isCountOfSymbolsValid(login: login)) {
            valid = false
        }
        
        if !isLoginSymbolsValid(login: login) {
            valid = false
            print("Bad symbols!")
        }
        
        if (!valid) {
            LoginField.backgroundColor = .red
        }
    }
    
    @IBOutlet weak var LoginField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func isCountOfSymbolsValid(login: String) -> Bool {
        switch login.count {
        case 3...32:
            return true
        default:
            return false
        }
    }
    
    func isLoginSymbolsValid(login: String) -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-z][a-z0-9.-]*$", options: NSRegularExpression.Options.caseInsensitive)
        let matches = regex.matches(in: login, options: [], range: NSRange(location: 0, length: login.utf16.count))
        return matches.count > 0
    }

}

