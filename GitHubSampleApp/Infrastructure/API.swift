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
    
    let baseUrl = "https://developer.github.com/v3/users"
    let authHeader: HTTPHeaders = ["Authorization": "Bearer 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"]
    
    enum ApiError: Error {
        case fail
    }
    
    func getUsers(per: Int, page: Int) -> Future<[UserModel], Error> {
        
        let parametes: [String: Any] = ["per_page": page, "per": per]
        
        return Future<[UserModel], Error> { promise in
            AF.request(self.baseUrl, parameters: parametes, headers: self.authHeader).responseData { response in
                guard let data = response.data else {
                    promise(.failure(ApiError.fail))
                    return
                }
                do {
                    let users = try JSONDecoder().decode([UserModel].self, from: data)
                    print(users)
                    promise(.success(users))
                } catch let error {
                    promise(.failure(ApiError.fail))
                    print("Error: \(error)")
                }
            }
            
        }
    }
    
    func getRepositories(username: String) ->Future<[RepositoryModel], Error> {
        
        let repositoryUrl = self.baseUrl + "/\(username)/repos"
        
        return Future<[RepositoryModel], Error> { promise in
            AF.request(repositoryUrl, headers: self.authHeader).responseData { response in
                guard let data = response.data else {
                    promise(.failure(ApiError.fail))
                    return
                }
                do {
                    let repositories = try JSONDecoder().decode([RepositoryModel].self, from: data)
                    print(repositories)
                    promise(.success(repositories))
                } catch let error {
                    promise(.failure(ApiError.fail))
                    print("Error: \(error)")
                }
            }
            
        }
    }
    
//    per_page=100&page=1
    
    
    
}
