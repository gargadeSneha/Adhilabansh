//
//  ScanHistory.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 26/07/23.
//2023-07-08T11:28:09.060

import SwiftUI
import Alamofire

struct ScanHistory: View {
    @State private var hederText = "Scan"
    @State private var campaignText = ""
    @State private var amountText = ""
    @State private var dateTimeText = ""
    @State private var voucherDic:  [Any] = []
    @State private var userTransacArray:  [Values] = []
    var getUserTransactionArray = [Values]()
    
    var getUserTransationResponse = [String: Any]()
    
    var  array = ["Sneha","Akash","Sawalkar","Tina","Omkar","Sager","Neha","Amita","Sakshi","Bhakti"]

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
           return formatter
       }
    
    private var dateFormatter1: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/mm/yyyy - hh:mm"
           return formatter
       }
    
    
    var body: some View {
        let inputDateString = "2023-07-08T11:28:09.060"
        let result = dateFormatter.date(from: inputDateString)
        let _ = print(result!)
        
        let data = dateFormatter1.string(from: result!)
        let _ = print("---",data)
        NavigationStack{
            ZStack{
                
                Image("background3")
                    .resizable()
                    .edgesIgnoringSafeArea(.trailing)
                    .edgesIgnoringSafeArea(.bottom)
                    .edgesIgnoringSafeArea(.top)
                CustomNavigationBar(text:  $hederText)
                VStack{
                    Text("Voucher:")
                        .position(x: 50, y: 55)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                    List(0..<userTransacArray.count, id: \.self) { index in
                    
                        ZStack {
                            Image("coupen_bg")
                                .frame(width: 700, height: 100)
                            HStack{
                                
                                VStack{
                    
                                    Text(userTransacArray[index].campaignName!)
                                        .bold()
                                        .font(.system(size: 15))
                                        .frame(width: 260, height: 45, alignment: .leading)
                        
                                    Text(data)
                                        .frame(alignment: .top)
                                        .frame(width: 260, height: 45)
                                        .position(x: -15, y: 5)
                                }
                                .font(.system(size: 14))
                                .position(x: 60, y: 40)

                                    .frame(width: 100, height: 80)
                                    .position(x: 325, y: 53)
                                VStack{
                                    Text(String(userTransacArray[index].amount!))
                                        .frame(width: 50, height: 45)
                                    if userTransacArray[index].isPendingApproval == 1{
                                        Image("approve")
                                    }
                                    else if userTransacArray[index].isPendingApproval == 3 {
                                        Image("pending")
                                    }
                                    else if userTransacArray[index].isPendingApproval == 4 {
                                        Image("reject")
                                    }
                                }
                                    .frame(width: 100, height: 80)
                                    .position(x: 130, y: 53)
                            }
                        } //Zstack
                       
                        .buttonStyle(PlainButtonStyle())//Button
                        .listRowBackground(Color.clear)
                        .cornerRadius(5)
                    } .listStyle(.plain)     //List
                        .frame(width: 400, height: 700)
                        .position(x: 195, y: 40)
                    
                }
            }.onAppear{
                self.getUserTransation()
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    func getUserTransation() {
        
        let body: [String: Any] = ["id":112]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: body)
        
        //  "https://flaskcontact-list-app.herokuapp.com/contacts"
        let url = URL(string: "https://alemac.logthis.in/api/TransactionAPI/GetUserTransaction/")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print("-----> data: \(data!)")
            print("-----> error: \(error)")
            
            if let data = data {
                
                do{
                    let objUserTransaction = try JSONDecoder().decode(GetUserTransactionGetModels.self, from: data)
                    if let dataArray = objUserTransaction.data{
                        userTransacArray = dataArray
                    }
                    else {
                        print("Empty filename.")
                }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
}

struct ScanHistory_Previews: PreviewProvider {
    static var previews: some View {
        ScanHistory()
    }
}
