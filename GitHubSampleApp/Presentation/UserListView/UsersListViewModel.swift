//
//  UsersListViewModel.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import Foundation
import Combine

class UsersListViewModel: ObservableObject {

    var currentPage: Int = 0
    
    @Published var users: [UserEntity] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    func loadMoreContent() {
        
        let page = self.currentPage
        
        Task {
            let users = try await UserRepository().getUsers(per: 100, page: page)
            
            DispatchQueue.main.async {
                self.users += users
            }
            
            self.currentPage += 1
            print(currentPage)
        }
    }
}
