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
            UsersListView(vm: UsersListViewModel())

        }
    }
}

