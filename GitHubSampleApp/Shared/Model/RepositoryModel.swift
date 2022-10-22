//
//  RepositoryModel.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import Foundation

class RepositoryModel: Identifiable, Codable {
    let id: Int
    let name: String?
    let language: String?
    let stargazers_count: Int?
    let description: String?
    let html_url: String?
    let fork: Bool?
}
