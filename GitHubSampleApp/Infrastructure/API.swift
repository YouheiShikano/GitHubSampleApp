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
    
    func getUsers(per: Int, page: Int) async throws -> [UserModel] {
        
        let parametes: [String: Any] = ["per_page": page, "per": per]
        let dataTask = AF.request(self.baseUrl, parameters: parametes, headers: self.authHeader).serializingDecodable([UserModel].self, decoder: JSONDecoder())
        
        var users: [UserModel] = []
        
        do {
            users = try await dataTask.value
        } catch {
            print(ApiError.fail)
        }
        
        
        return users
        
    }
    
    func getRepositories(username: String) async throws -> [RepositoryModel] {
        
        let repositoryUrl = self.baseUrl + "/\(username)/repos"
        let dataTask = AF.request(repositoryUrl, headers: self.authHeader).serializingDecodable([RepositoryModel].self, decoder: JSONDecoder())
        
        var repositories: [RepositoryModel]
        
        do {
            repositories = try await dataTask.value
        } catch {
            print(ApiError.fail)
        }
        
        return repositories
        
    }
    
}
