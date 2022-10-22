//
//  UsersListView.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import Foundation
import SwiftUI

struct UsersListView: View {
    
    @StateObject var vm: UsersListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(vm.output.users) { user in
                        
                        NavigationLink {
                            UserRepositoriesView()
                        } label: {
                            HStack {
                                Text(user.name ?? "")
                            }
                            
                        }
                        
                    }
                    
                    ProgressView()
                        .onAppear {
                            print("### onAppear loadMoreContent")
                            self.vm.loadMoreContent()
                        }
                }
            }
        }.listStyle(PlainListStyle())
    }
}

struct UsersListView_Previews: PreviewProvider {
    static var previews: some View {
        UsersListView()
    }
}
