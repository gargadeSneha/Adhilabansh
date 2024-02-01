//
//  LunchScreen.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 12/07/23.
//

import SwiftUI

struct LunchScreen: View {
    @State private var userId: Int = 6
    @State var isActive: Bool = false
    @State var PhoneNumber: String = ""
    var body: some View {
        ZStack {
                if self.isActive {
                    if UserDefaults.standard.object(forKey: "phoneNo") != nil {
                        HomeScreen(userId: $userId)
                    }
                    else{
                        ContentView()
                    }
                  
                } else {
                    Rectangle()
                    ZStack{
                        Image("Group_308")
                            .resizable()
                            .edgesIgnoringSafeArea(.top)
                            .edgesIgnoringSafeArea(.bottom)
                        HStack{
                            Image("Alemac_App_Logo")
                        }
                        
                    }.onAppear{
                        
                    }
                }
            }
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }

struct LunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LunchScreen()
    }
}
