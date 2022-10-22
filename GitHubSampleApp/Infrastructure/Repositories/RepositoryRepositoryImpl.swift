//
//  RepositoryRepositoryImpl.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import Combine

class RepositoryRepositoryImpl: IRepositoryRepository, ObservableObject {
    func getUsers(per: Int, page: Int) async throws -> [UserModel] {
        let users = try await Api().getUsers(per: per, page: page)
        return users
    }
    
    func getRepositories(userName: String) async throws -> [RepositoryModel] {
        let repositories = try await Api().getRepositories(username: userName)
        return repositories
    }
}
