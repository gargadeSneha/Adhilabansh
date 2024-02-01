//
//  PDFViewer.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 08/08/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
struct PDFViewer: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var hederText = "PDF Viewer"
    let urlString: String
    var body: some View {
        NavigationStack{
            ZStack{
                let _ = print(urlString)
                Image("background3")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .edgesIgnoringSafeArea(.bottom)
                CustomNavigationBar(text: $hederText)
                    .padding(.top, 15)

                HStack{
                    WebView(urlString: urlString)
                }
                .padding(.top, 47)
                .frame(height: 790)
                
            }
        }.navigationBarBackButtonHidden(true)
    }
}

