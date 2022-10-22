//
//  UserRepositoriesViewModel.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import Foundation
import Combine

class UserRepositoriesViewModel: ViewModelObject  {
    let input: Input
    let output: Output
    let repositoryRepository: IRepositoryRepository
    let userRepository: IUserRepository
    @BindableObject private(set) var binding: Binding
    var currentPage: Int = 0
    var userName: String
    
    final class Input: InputObject {
    }
    
    final class Output: OutputObject {
        @Published var repositories: [RepositoryModel] = []
        @Published var user: UserModel?
    }
    
    final class Binding: BindingObject {
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init(userName: String, repositoryRepository: IRepositoryRepository, userRepository: IUserRepository) {
        self.input = Input()
        self.output = Output()
        self.binding = Binding()
        
        self.repositoryRepository = repositoryRepository
        self.userRepository = userRepository
        
        
        self.userName = userName
        
        self.getRepository()
        
        self.getUser()

    }
    
    func getUser() {
        Task {
            let user = try await userRepository.getUser(username: userName)
            
            DispatchQueue.main.async {
                self.output.user = user
            }
            
        }
    }
    
    func getRepository() {
        
        Task {
            let repositories = try await repositoryRepository.getRepositories(userName: userName)
            
            DispatchQueue.main.async {
                self.output.repositories = repositories
            }
            
            self.currentPage += 1
            print(currentPage)
        }
    }
}
