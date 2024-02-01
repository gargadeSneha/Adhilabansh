//
//  OTPScreen.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 12/07/23.
//

import SwiftUI

struct OTPScreen: View {
    
    @State private var userId: Int = 6
    @State private var firstNo: String = ""
    @State private var secondNo: String = ""
    @State private var thirdNo: String = ""
    @State private var fourthNo: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack{
                Image("Group_308")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .edgesIgnoringSafeArea(.bottom)
                VStack {
                    Image("Alemac_App_Logo")
                        .position(x: 200, y: 150)
                        .aspectRatio(contentMode: .fit)
                }.padding(.bottom, 15)
                VStack{
                    
                    Text("Enter OTP")
                        .position(x: 67, y: 450)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    HStack{
                        TextField("", text: $firstNo).bold()
                            .padding(.horizontal, 35)
                            .frame(width: 80, height: 50, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(5)
                            .position(x: 68, y: 305)
                        TextField("", text: $secondNo).bold()
                            .padding(.horizontal, 35)
                            .frame(width: 80, height: 50, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(5)
                            .position(x: 53, y: 305)
                        TextField("", text: $thirdNo).bold()
                            .padding(.horizontal, 35)
                            .frame(width: 80, height: 50, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(5)
                            .position(x: 39, y: 305)
                        TextField("", text: $fourthNo).bold()
                            .padding(.horizontal, 35)
                            .frame(width: 80, height: 50, alignment: .center)
                            .background(Color.white)
                            .cornerRadius(5)
                            .position(x: 24, y: 305)
                    }
                   
                    VStack{
                        Text("Resend OTP in ")
                            .position(x: 175, y: 230)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: RegisterScreen()) {
                            Text("Resend OTP").bold().underline()

                                .font(.system(size: 15))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .position(x: 200, y: 180)
                        }.buttonStyle(PlainButtonStyle())
                    }
                                        
                    NavigationLink(destination: HomeScreen(userId: $userId)) {
                        Text("Log in")
                            .frame(width: 230, height: 50)
                            .background(.red)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .position(x: 195, y: -15)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct OTPScreen_Previews: PreviewProvider {
    static var previews: some View {
        OTPScreen()
    }
}
