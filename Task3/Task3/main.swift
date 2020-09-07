//
//  main.swift
//  Task3
//
//  Created by Elizaveta Shabalina on 08.09.2020.
//  Copyright © 2020 Elizaveta Shabalina. All rights reserved.
//

import Foundation
import Alamofire

// let sema = DispatchSemaphore(value: 0)

let headers: HTTPHeaders = [
    "Accept": "application/vnd.github.v3+json"
]

AF.request("https://api.github.com/users/lizasha/repos", headers: headers).responseJSON { result in
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
