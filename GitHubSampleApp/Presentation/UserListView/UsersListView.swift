//
//  UsersListView.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import Foundation
import SwiftUI
import URLImage

struct UsersListView: View {
    
    @StateObject var vm: UsersListViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(vm.output.users) { user in
                        
                        NavigationLink {
                            UserRepositoriesView(vm: UserRepositoriesViewModel(userName: user.login ?? "", repositoryRepository: RepositoryRepositoryImpl(), userRepository: UserRepositoryImpl()))
                        } label: {
                            HStack {
                                if let url = URL(string: user.avatar_url ?? "") {
                                    URLImage(url: url) { image in
                                        image.image?.resizable().aspectRatio(contentMode: .fill)
                                    }.frame(width: 60, height: 60).cornerRadius(30).clipped()
                                }
                                Text(user.login ?? "").font(.title).foregroundColor(.black).padding()
                                Spacer()
                            }.padding()
                            
                        }
                        
                    }
                    
                    ProgressView()
                        .onAppear {
                            print("### onAppear loadMoreContent")
                            self.vm.loadMoreContent()
                        }
                }
            }
            .navigationTitle("ユーザー一覧")
        }.listStyle(PlainListStyle())
            
    }
}
