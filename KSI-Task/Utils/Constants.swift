//
//  Constants.swift
//  KSI-Task
//
//  Created by Mohamed Moustafa on 10/06/2023.
//

import Foundation

struct Constants {

#if DEBUG
    static let isUsingTestEnv = true
#else
    static let isUsingTestEnv = true
#endif

    static var link: String {

        if isUsingTestEnv {
            return "run.mocky.io" // test
        } else {
            return "run.mocky.io" // production
        }
    }

    static var baseUrl: String {
        return "https://\(link)/v3/9677ed07-93eb-42a6-9e26-5a9cbbca658f"
    }

    static var apiCredentials = ""
}
