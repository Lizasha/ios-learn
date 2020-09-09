//
//  main.swift
//  Task3
//
//  Created by Elizaveta Shabalina on 08.09.2020.
//  Copyright © 2020 Elizaveta Shabalina. All rights reserved.
//

import Foundation
import Alamofire

var username = readLine() //assume you enter your Name
print(username)

let headers: HTTPHeaders = [
    "Accept": "application/vnd.github.v3+json"
]
var requestURL = "https://api.github.com/users/" + String(username!) + "/repos"

AF.request(requestURL, headers: headers).responseJSON { result in
    // tell compiler that response result value is dictionary array
    let repositories = (result.value as! [NSDictionary])
    
    for repository in repositories {
        let name = repository["name"] as! String
        print(name)
    }
    
    // Close the programm
    exit(EXIT_SUCCESS)
}

// do not end the program
dispatchMain()
