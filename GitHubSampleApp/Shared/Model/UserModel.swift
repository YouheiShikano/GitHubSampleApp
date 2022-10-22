//
//  UserModel.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import Foundation


class UserModel: Identifiable, Codable {
    let id: Int
    let name: String?
    let avatar_url: String?
    let following_url: String?
    let followers_url: String?
    let created_at: String?
    let updated_at: String?
    
}


