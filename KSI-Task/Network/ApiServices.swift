//
//  ApiServices.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import Foundation
import Alamofire

class ApiServices: NSObject {

    private let sourcesURL = URL(string: Constants.baseUrl)!

    func getProductsData(completion: @escaping (Result<ProductsResponse, Error>) -> Void) {
        AF.request(sourcesURL).responseDecodable(of: ProductsResponse.self) { response in
            switch response.result {
            case .success(let products):
                completion(.success(products))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
