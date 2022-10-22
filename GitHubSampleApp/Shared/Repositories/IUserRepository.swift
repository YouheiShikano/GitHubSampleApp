//
//  IUserRepository.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import Foundation

protocol IUserRepository {
    func getUsers(per: Int, page: Int) async throws -> [UserModel]
    func getUser(username: String) async throws -> UserModel?
}
