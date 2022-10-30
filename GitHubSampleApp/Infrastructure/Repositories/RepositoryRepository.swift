//
//  RepositoryRepositoryImpl.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

class RepositoryRepository {
    func getUsers(per: Int, page: Int) async throws -> [UserEntity] {
        let users = try await Api().getUsers(per: per, page: page)
        return users
    }
    
    func getRepositories(userName: String) async throws -> [RepositoryEntity] {
        let repositories = try await Api().getRepositories(username: userName)
        return repositories
    }
}
