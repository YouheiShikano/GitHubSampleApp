//
//  IRepositoryRepository.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import Foundation

protocol IRepositoryRepository {
    func getRepositories(userName: String) async throws -> [RepositoryEntity]
}
