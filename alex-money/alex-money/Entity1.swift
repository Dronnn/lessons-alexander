//
//  Entity1.swift
//  alex-money
//
//  Created by andrew mayer on 11.11.23.
//

import Foundation

class Entity1: Entity2Delegate {
    func entity2(_ entity2: Entity2, rez data: Int) {
        entity2.title
    }
    

    func rez(data: Int) {
        print(data)
    }
    
    let entity21 = Entity2()
    let entity22 = Entity2()

    func create() {
        entity22.title = "title"

        entity21.delegate = self
        entity22.delegate = self
    }

}

let entity1 = Entity1()
