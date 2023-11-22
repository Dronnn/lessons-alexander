//
//  Entity2.swift
//  alex-money
//
//  Created by andrew mayer on 11.11.23.
//

import Foundation

protocol Entity2Delegate: AnyObject {
    func entity2(_ entity2: Entity2, rez data: Int)
    func rez(data: Int)
}

extension Entity2Delegate {
    func rez(data: Int) { }
}

class Entity2 {

    weak var delegate: Entity2Delegate?

    var title: String = ""

    func x() {
        delegate?.rez(data: 5)
        delegate?.entity2(self, rez: 5)
    }

}

//let entity2 = Entity2()
