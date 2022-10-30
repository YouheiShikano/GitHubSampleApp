//
//  UserRepositoryImpl.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

class UserRepository {
    
    func getUsers(per: Int, page: Int) async throws -> [UserEntity] {
        let users = try await Api().getUsers(per: per, page: page)
        return users
    }
    
    func getUser(username: String) async throws -> UserEntity? {
        let user = try await Api().getUser(username: username)
        return user
    }
}
