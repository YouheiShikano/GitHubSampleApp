//
//  WebViewPage.swift
//  GitHubSampleApp
//
//  Created by 鹿野耀平 on 2022/10/22.
//

import SwiftUI
import WebView

struct WebViewPage: View {
    let url: String
    @StateObject var webViewStore = WebViewStore()

    var body: some View {

          WebView(webView: webViewStore.webView)

          .navigationBarTitle(Text(verbatim: webViewStore.title ?? ""), displayMode: .inline)
          .navigationBarItems(trailing: HStack {
            Button(action: goBack) {
              Image(systemName: "chevron.left")
                .imageScale(.large)
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            }.disabled(!webViewStore.canGoBack)
            Button(action: goForward) {
              Image(systemName: "chevron.right")
                .imageScale(.large)
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
            }.disabled(!webViewStore.canGoForward)
          })
      .onAppear {
          print("onAppear: WebViewPage")

        self.webViewStore.webView.load(URLRequest(url: URL(string: url)!))
      }
    }

    func goBack() {
      webViewStore.webView.goBack()
    }

    func goForward() {
      webViewStore.webView.goForward()
    }
}

struct WebViewPage_Previews: PreviewProvider {
    static var previews: some View {
        WebViewPage(url: "")
    }
}

