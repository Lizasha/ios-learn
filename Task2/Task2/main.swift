//
//  main.swift
//  Task2
//
//  Created by Elizaveta Shabalina on 18.09.2020.
//

import Foundation
print(57)

let serialQueue = DispatchQueue(label: "com.foo.bar")
// let serialQueue2 = DispatchQueue(label: "com.foo.sd")

serialQueue.async {
    print("Work 1")
    serialQueue.sync {
        print("Work 2")
    }
}

print("Work 3")

//sleep(1)
