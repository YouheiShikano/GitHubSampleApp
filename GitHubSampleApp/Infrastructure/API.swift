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
    
    func getUsers(per: Int, page: Int) async throws -> [UserEntity] {
        
        let parametes: [String: Any] = ["per_page": per, "page": page]
        let dataTask = AF.request(self.baseUrl, parameters: parametes, headers: self.authHeader).serializingDecodable([UserEntity].self, decoder: JSONDecoder())
        
        var users: [UserEntity] = []
        
        do {
            users = try await dataTask.value
        } catch {
            print(ApiError.fail)
        }
        
        
        return users
        
    }
    
    func getUser(username: String) async throws -> UserEntity? {
        let userUrl = self.baseUrl + "/\(username)"
        let dataTask = AF.request(userUrl, headers: self.authHeader).serializingDecodable(UserEntity.self, decoder: JSONDecoder())
        
        var user: UserEntity? = nil
        
        do {
            user = try await dataTask.value
        } catch {
            print(ApiError.fail)
        }
        
        return user
    }
    
    func getRepositories(username: String) async throws -> [RepositoryEntity] {
        
        let repositoryUrl = self.baseUrl + "/\(username)/repos"
        let dataTask = AF.request(repositoryUrl, headers: self.authHeader).serializingDecodable([RepositoryEntity].self, decoder: JSONDecoder())
        
        var repositories: [RepositoryEntity] = []
        
        do {
            repositories = try await dataTask.value
        } catch {
            print(ApiError.fail)
        }
        
        return repositories
        
    }
    
}
