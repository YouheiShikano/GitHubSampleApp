//
//  UsersListViewModel.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import Foundation
import Combine

class UsersListViewModel: ViewModelObject  {
    let input: Input
    let output: Output
    let userRepository: IUserRepository
    @BindableObject private(set) var binding: Binding
    var currentPage: Int = 0
    
    final class Input: InputObject {
    }
    
    final class Output: OutputObject {
        @Published var users: [UserEntity] = []
    }
    
    final class Binding: BindingObject {
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init(userRepository: IUserRepository) {
        self.input = Input()
        self.output = Output()
        self.binding = Binding()
        
        self.userRepository = userRepository

    }
    
    func loadMoreContent() {
        
        let page = self.currentPage
        
        Task {
            let users = try await userRepository.getUsers(per: 100, page: page)
            
            DispatchQueue.main.async {
                self.output.users += users
            }
            
            self.currentPage += 1
            print(currentPage)
        }
    }
}
