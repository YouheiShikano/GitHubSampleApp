//
//  GitHubSampleAppApp.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/21.
//

import SwiftUI

@main
struct GitHubSampleAppApp: App {
    var body: some Scene {
        WindowGroup {
            UsersListView()
                .environmentObject(
                Container(userRepository: UserRepositoryImpl(),
                          repositoryRepository: RepositoryRepositoryImpl()))
        }
    }
}

class Container: ObservableObject {
    static let shared = Container(userRepository: UserRepositoryImpl(), repositoryRepository: RepositoryRepositoryImpl())
    
    let userRepository: IUserRepository
    let repositoryRepository: IRepositoryRepository
    
    init(userRepository: IUserRepository, repositoryRepository: IRepositoryRepository) {
        self.userRepository = userRepository
        self.repositoryRepository = repositoryRepository
    }
}
