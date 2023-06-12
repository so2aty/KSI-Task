//
//  ProductModel.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

// MARK: - ProductModel
struct ProductModel: Codable {
    var id: Int?
    var title: String?
    var description: String?
    var price: Int?
    var brand: String?
    var thumbnail: String?
    var images: [String]
}


struct ProductsResponse: Codable {
    let products: [ProductModel]
    let total: Int
    let skip: Int
    let limit: Int
}
