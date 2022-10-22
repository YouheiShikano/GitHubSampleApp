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
    @BindableObject private(set) var binding: Binding
    var currentPage: Int = 1
    
    final class Input: InputObject {
    }
    
    final class Output: OutputObject {
        @Published var users: [UserModel] = []
    }
    
    final class Binding: BindingObject {
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.input = Input()
        self.output = Output()
        self.binding = Binding()

    }
    
    func loadMoreContent() {
        
        let page = self.currentPage
        
        IUserRepository.get
    }

}
