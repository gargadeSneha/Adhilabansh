//
//  Brochure.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 26/07/23.
//

import SwiftUI
import Alamofire
import WebKit

struct Brochure: View {
    @State private var hederText = "Company Brochure"
    @State private var isSelected = false
    @State private var text = ""
    @State private var brochureArray:  [Data1] = []
    
    var brochureResponse = [NSDictionary]()
    var  array = ["Sneha","Akash","Sawalkar","Tina","Omkar","Sager","Neha","Amita","Sakshi","Akshta","Neil","Niti","Bhakti","Soham","Tanu","Om"]
    
    var body: some View {
        NavigationStack{
            ZStack{
                Image("background3")
                    .resizable()
                    .edgesIgnoringSafeArea(.trailing)
                    .edgesIgnoringSafeArea(.bottom)
                    .edgesIgnoringSafeArea(.top)
                CustomNavigationBar(text: $hederText)
                VStack{
                    
//                    Link("sdf", destination: URL(string: "https://alemac.logthis.in/BrochurePrice/Alemac%20Modular%20Cat%20for%20Alme%20web_20230619114238.pdf")!)
//

                        VStack{
                            List(0..<brochureArray.count, id: \.self) { index in
                                var urlPath = "https://alemac.logthis.in/" + "BrochurePrice/" + brochureArray[index].documentPath!

                                NavigationLink(destination: PDFViewer(urlString: urlPath)) {
                                HStack {
                                        Image("pdf")
                                            .frame(width: 50)
                                        
                                        Text(brochureArray[index].fileName!)
                                            .frame(width: 260, height: 50, alignment: .leading)
                                            .foregroundColor(.black)
                                        Image("view")
                                            .frame(width: 20)
                                        Spacer()
                                    }.cornerRadius(5) //Hstack
                                }.background(.white)
//                                  .opacity(0.9)
                                    .buttonStyle(PlainButtonStyle())//Button
                                    .frame(width: 355, height: 50)
                                    .listRowBackground(Color.clear)
                                    .cornerRadius(5)
                            } .listStyle(.plain)     //List
                                .position(x: 195, y: 430)
                        }//list vstcak
                        .onAppear{
                            getBrochureData()
                        }
            }//Vtstack
        }//zstack
    }.navigationBarBackButtonHidden(true)
        
    }//body
    
    
     
     func getBrochureData() {
            let headers = HTTPHeaders(["Content-Type": "application/json"])
            
            AF.request("https://alemac.logthis.in/api/BrochurePriceAPI/GetBrochurePriceDocument/?type=1", method: .post, encoding: URLEncoding.default, headers: headers)
                .validate(statusCode: 200 ..< 600)
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        do {
                            let decoder = JSONDecoder()
                            let BrochuresData = try decoder.decode(BrochuresDataGetModels.self, from: data)
                            print("Brochures:", (BrochuresData.data![0].fileName)!)
                            if let dataArray = BrochuresData.data{
                                brochureArray = dataArray
//                                self.brochureArray = dataArray.compactMap { $0.fileName }
                            }
                            else {
                                print("Empty filename.")
                        }
                        } catch {
                            print("Decoding Error:", error)
                        }
                    case .failure(let error):
                        print("GET Error:", error)
                    }
                }
        }
    }
    
    
    struct Brochure_Previews: PreviewProvider {
        static var previews: some View {
            Brochure()
        }
    }
    
    

//     func getBrochuresData(){
////         var value = [NSDictionary]()
//        guard let url = URL(string: "https://alemac.logthis.in/api/BrochurePriceAPI/GetBrochurePriceDocument/?type=1") else {
//                  return
//              }
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//              URLSession.shared.dataTask(with: request) { data, response, error in
//                  if let error = error {
//                      print(error.localizedDescription)
//                  }
//                  if let data = data {
//                      do {
//                          let jsondata = try JSONSerialization.jsonObject(with: data) as! NSDictionary
//                          print(jsondata)
//
////                          print(jsondata.data.fileName)
////                          print(self.brochureResponse)
//                      }catch {
//                          print("Somthing went wrong")
//                      }
//                  }
//              }.resume()
//    }


