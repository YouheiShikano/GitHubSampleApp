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
    
    let baseUrl = "https://api.github.com/users"
    let authHeader: HTTPHeaders = ["Authorization": "Bearer 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"]
    
    enum ApiError: Error {
        case fail
    }
    
    func getUsers(per: Int, page: Int) async throws -> [UserModel] {
        
        let parametes: [String: Any] = ["per_page": per, "page": page]
        let dataTask = AF.request(self.baseUrl, parameters: parametes, headers: self.authHeader).serializingDecodable([UserModel].self, decoder: JSONDecoder())
        
        var users: [UserModel] = []
        
        do {
            users = try await dataTask.value
        } catch {
            print(ApiError.fail)
        }
        
        
        return users
        
    }
    
    func getUser(username: String) async throws -> UserModel? {
        let userUrl = self.baseUrl + "/\(username)"
        let dataTask = AF.request(userUrl, headers: self.authHeader).serializingDecodable(UserModel.self, decoder: JSONDecoder())
        
        var user: UserModel? = nil
        
        do {
            user = try await dataTask.value
        } catch {
            print(ApiError.fail)
        }
        
        return user
    }
    
    func getRepositories(username: String) async throws -> [RepositoryModel] {
        
        let repositoryUrl = self.baseUrl + "/\(username)/repos"
        let dataTask = AF.request(repositoryUrl, headers: self.authHeader).serializingDecodable([RepositoryModel].self, decoder: JSONDecoder())
        
        var repositories: [RepositoryModel] = []
        
        do {
            repositories = try await dataTask.value
        } catch {
            print(ApiError.fail)
        }
        
        return repositories
        
    }
    
}
