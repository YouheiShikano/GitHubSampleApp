//
//  UserRepositoriesViewModel.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import Foundation
import Combine

class UserRepositoriesViewModel: ObservableObject {

    var userName: String
    
    @Published var repositories: [RepositoryEntity] = []
    @Published var user: UserEntity?

    private var cancellables = Set<AnyCancellable>()
    
    init(userName: String) {

        self.userName = userName
        
        self.getRepository()
        
        self.getUser()

    }
    
    func getUser() {
        Task {
            let user = try await UserRepository().getUser(username: userName)
            
            DispatchQueue.main.async {
                self.user = user
            }
            
        }
    }
    
    func getRepository() {
        
        Task {
            let repositories = try await RepositoryRepository().getRepositories(userName: userName)
            
            DispatchQueue.main.async {
                self.repositories = repositories
            }
        }
    }
}
