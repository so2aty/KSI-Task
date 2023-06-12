//
//  ProductClass.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 12/06/2023.
//

import Foundation
import RealmSwift

class ProductClass: Object {
    @objc dynamic  var id = 0
    @objc dynamic var title = ""
    @objc dynamic  var desc = ""
    @objc dynamic var price = 0
    @objc dynamic var brand = ""
    @objc dynamic var thumbnail = ""
    var images = List<String>()
}

