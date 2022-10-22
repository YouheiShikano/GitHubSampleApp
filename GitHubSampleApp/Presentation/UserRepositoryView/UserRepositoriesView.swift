//
//  UserRepositoriesView.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import SwiftUI
import URLImage

struct UserRepositoriesView: View {
    
    @StateObject var vm: UserRepositoriesViewModel
    
    
    var body: some View {
        VStack {
            HStack {
                if let url = URL(string: vm.output.user?.avatar_url ?? "") {
                    URLImage(url: url) { image in
                        image.image?.resizable().aspectRatio(contentMode: .fill)
                    }.frame(width: 60, height: 60).cornerRadius(30).clipped()
                }
                VStack(alignment: .leading) {
                    if vm.output.user?.name != "" {
                        Text(vm.output.user?.name ?? "（本名未登録）").font(.title)
                        Text(vm.output.user?.login ?? "")
                    }
                    
                }.padding()
                
                Spacer()
            }.padding()
            
            HStack {
                Spacer()
                Text("フォロワー数")
                Text(vm.output.user?.followers?.description ?? "0")
                Spacer()
                Text("フォロイー数")
                Text(vm.output.user?.following?.description ?? "0")
                Spacer()
            }
            
            List {
                Section("リポジトリ一覧") {
                    ForEach(vm.output.repositories) { repository in
                        
                        if repository.fork == false {
                            NavigationLink {
                                WebViewPage(url: repository.html_url ?? "")
                            } label: {
                                RepositoryCell(repository: repository)

                            }
                        }
                    }
                }
            }
                     
        }.navigationTitle("ユーザー詳細画面")
    }
}

struct RepositoryCell: View {
    
    var repository: RepositoryModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(repository.name ?? "").font(.title)
                Spacer()
                Text(repository.language ?? "").foregroundColor(Color.gray)
                Image(systemName: "star.fill")
                Text(repository.stargazers_count?.description ?? "")
            }
            Text(repository.description ?? "").multilineTextAlignment(.leading)
        }
    }
}
