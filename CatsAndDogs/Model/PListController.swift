//
//  PListController.swift
//  CatsAndDogs
//
//  Created by Vincent Villaflores on 25/10/2023.
//

import Foundation
import UIKit

class UserStorage {
    private let manager = FileManager.default
    private let url: URL
    private var faveList: [Int]
    
    init() {
        // Get path to save plist
        url = manager.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("Property List.plist")
        faveList = []
        
        // Create plist in sandbox if it doesn't exist
        if !manager.fileExists(atPath: url.path) {
            manager.createFile(atPath: url.path, contents: nil, attributes: nil)
        }
        
        faveList = read()
    }
    
    func write(id: Int) {
        if (!faveList.contains(id)){
            faveList.append(id)
            print("Saving: \(id)")
            let encoder = PropertyListEncoder()
            let encodedData = try! encoder.encode(faveList)
            try! encodedData.write(to: url)
        }
    }
    
    func read() -> [Int] {
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        let arr = try! decoder.decode([Int].self, from: data)
        return arr
    }
}
