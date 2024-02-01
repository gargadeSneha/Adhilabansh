//
//  AccountStatus.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 26/07/23.
//

import SwiftUI
import FlexibleSteppedProgressBar
import Alamofire

struct AccountStatus: View {
    @State private var currentStep: Int = 3
    @Binding var userId: Int
    private let totalSteps: Int = 3
    var stepTexts: [String] = ["Account Details", "In Review", "Approved"]
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                Image("Group_308")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .edgesIgnoringSafeArea(.bottom)
                VStack {
                    Image("Alemac_App_Logo")
                        .position(x: 200, y: -30)
                        .aspectRatio(contentMode: .fit)
                }.padding(.bottom, 15)
//                    .onAppear() { userStatus() }
                VStack{
                    Text("Account Status")
                        .frame(width: 270, height: 50 , alignment: .leading)
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold))
                        .position(x: 250, y: 240)
                    
                    ProgressBar(currentStep: $currentStep, totalSteps: totalSteps, stepTexts: stepTexts)
                        .frame(height: 50)
                        .padding(.horizontal, 30)
                        .position(x: 200, y: -75)
                }.onAppear{print("AccountID: ",userId)}
                Image("user")
                    .position(x: 200, y: 470)
                VStack{
                    Image("hour-glass")
                        .frame(width: 50, height: 50)
                }.background(.pink)
                    .cornerRadius(30)
                    .position(x: 250, y: 530)
                
                if currentStep == 3 {
                    NavigationLink(destination: HomeScreen(userId: $userId)) {
                        Text("Continue")
                            .frame(width: 250, height: 50)
                            .background(.red)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .position(x: 200, y: 620)
                    }.buttonStyle(PlainButtonStyle())
                }
            }
//            .onAppear{ userStatusGet() }
        }
    }
    

    func userStatusGet() {
        let headers = HTTPHeaders(["Content-Type": "application/json"])
        //        let userData = UserStatusPostModels(id: "601")
        AF.request("https://alemac.logthis.in/api/UserAPI/UserStatus/", method: .post, parameters: ["id":"601"],encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200 ..< 600)
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    print("POST Request Success:", data )
                    
                case .failure(let error):
                    
                    print("POST Request Error:", error)
                }
            }
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                       
                        let userStatusGetModel = try JSONDecoder().decode(UserStatusGetModels.self, from: data)
                        print("RESPONSE :", (userStatusGetModel.data.id)! )
                    } catch {
                        print("Decoding Error:", error)
                    }
                case .failure(let error):
                    print("GET Error:", error)
                }
            }
    }
   

}


struct ProgressBar: View {
    @Binding var currentStep: Int
    var totalSteps: Int
    var stepTexts: [String]

    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 0) {
                ForEach(1 ..< totalSteps, id: \.self) { step in
                    Circle()
                        .foregroundColor(step <= currentStep ? .pink : .gray)
                        .frame(width: 20, height: 30)

                    Rectangle()
                        .foregroundColor(step < currentStep ? .pink : .gray)
                        .frame(width: 90, height: 4)
                }

                Circle()
                    .foregroundColor(currentStep == totalSteps ? .pink : .gray)
                    .frame(width: 20, height: 30)
            }
            TextLabels(currentStep: $currentStep, totalSteps: totalSteps, stepTexts: stepTexts)
        }
    }
}

struct TextLabels: View {
    @Binding var currentStep: Int
    var totalSteps: Int
    var stepTexts: [String]

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0 ..< totalSteps) { step in
                Text(stepTexts[step])
                    .foregroundColor(.white)
                    .font(.caption)
                    .frame(width: 70 ,alignment: .leading)
                    .position(x:60, y: 10)

                if step < totalSteps - 1 {
                    Spacer()
                }
            }
        }
    }
}
