//
//  API.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/21.
//

import Foundation
import Alamofire
import Combine

class Api {
    
    let baseUrl = "https://developer.github.com/v3/"
    let authHeader: HTTPHeaders = ["Authorization": "Bearer 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"]
    
    enum ApiError: Error {
        case fail
    }
    
//    per_page=100&page=1
    
    
    
}
