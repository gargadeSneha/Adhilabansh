//
//  Profile.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 02/08/23.
//

import SwiftUI
import Alamofire
import SQLite3
import PhotosUI

struct Profile: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var db:DB_Manager = DB_Manager()
    @State private var userData = Array<Datum>()
    
    @State private var userId: Int = 6
    @State private var name: String = ""
    @State private var mobileNumber: String = ""
    @State private var role: String = ""
    @State private var distribution: String = ""
    @State private var DateOfBirth: String = ""
    @State private var anniversary: String = ""
    @State private var address: String = ""
    @State private var state: String = ""
    @State private var city: String = ""
    @State private var pincode: String = ""
    @State private var company: String = ""
    @State private var gst: String = ""
    @State private var adharNumber: String = ""
    @State private var pan: String = ""
    @State private var selectedBirthDate = Date()
    @State private var selectedAnniversaryDate =  Date()
    @State private var isBirthDatePickerVisible = false
    @State private var isAnniDatePickerVisible = false
    @State private var userDataArray: [String] = []
    @State private var userStatusId: Int = 0
    
    @State private var selectedImageData: Data?
    @State private var selectedItem: PhotosPickerItem?

    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
           formatter.dateFormat = "dd/MM/yyyy"
           return formatter
       }

    var body: some View {
        
        NavigationStack{
            ZStack{
                Image("background3")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .edgesIgnoringSafeArea(.bottom)
                ScrollView{
                    HStack{
                        Button(action : { self.presentationMode.wrappedValue.dismiss() }){
                            Image("left_arrow")
                        }
                        .frame(width: 230, height: 40, alignment: .leading)
                        NavigationLink(destination: HomeScreen(userId: $userId)){
                            HStack{
                                    Text("Save")
                                    .onTapGesture {
                                        print("press")
                                        saveData()
                                        }
                            }
                                .frame(width: 120, height: 30)
                                    .background(.red)
                                    .foregroundColor(.white)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .background(.green)
                        .padding(.top,10)
                    }
                    .position(x: 140, y: 5)
                    .frame(width: 280)
                    
                    VStack{
                        Text("Profile")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundColor(.white)
                            .position(x: 197, y: 75)
                        ZStack{
                            PhotosPicker(
                                       selection: $selectedItem,
                                       matching: .any(of: [.images, .videos]),
                                       photoLibrary: .shared()) {
                                           if let selectedImageData,
                                              let uiImage = UIImage(data: selectedImageData) {
                                                     Image(uiImage: uiImage)
                                                   .resizable()
                                                      .frame(width: 120, height: 121)
                                                      .cornerRadius(60, corners: .allCorners)
                                                      .position(x: 60, y: 60)
                                           } else {
                                               
                                               Image(systemName: "photo.fill.on.rectangle.fill")
                                                   .symbolRenderingMode(.multicolor)
                                                   .font(.system(size: 50))
                                                   .frame(width: 120, height: 120)
                                                   .foregroundColor(.accentColor)
                                           }
                                       }
                                       .onChange(of: selectedItem) { newItem in
                                           print(newItem)
                                           Task {
//                                                Retrieve selected asset in the form of Data
                                               if let data = try? await newItem!.loadTransferable(type: Data.self) {
                                                   selectedImageData = data
                                               }
                                           }
                                       }

                        }.border(Color.white, width: 1, cornerRadius: 60)
                            .frame(width: 120, height: 120)
                            .position(x: 200, y: 140)
                    }
                    VStack{

                        VStack{
                            Text("Name")
                                .position(x: 28, y: -10)
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.white)
                            EditTextField(placeholder: "", text: $name)
                                .position(x: 170, y: -10)

                            if name.isEmpty{
                                Text("Please enter Name").font(.footnote)
                                    .foregroundColor(.red)
                                    .position(x:285, y: -5)
                            }
                        }
                    }
                    .frame(width: 350, height: 55)
                    .border(width: 0.5, edges: [.bottom], color: .white)
                    .position(x: 195, y: 155)
                    
                    VStack{
                        VStack{
                            Text("Mobile Number")
                                .position(x: 62, y: 10)
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.white)
                            
                            EditTextField(placeholder: "", text: $mobileNumber)
                                .position(x: 170, y: 0)
                            
                            
                            if mobileNumber.isEmpty{
                                Text("Please Phone Number").font(.footnote)
                                    .foregroundColor(.red)
                                    .position(x:280, y: -5)
                            }
                        }
                    }
                    .frame(width: 350, height: 80)
                    .border(width: 0.5, edges: [.bottom], color: .white)
                    .position(x: 195, y: 170)
                    
                    VStack{
                        VStack{
                            Text("Date of Birth")
                                .position(x: 55, y: 10)
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.white)
                            
                            VStack {
                                Button(action: {
                                    isBirthDatePickerVisible.toggle()
                                }) {
                                    Text(dateFormatter.string(from: selectedBirthDate))
                                        .padding(.leading, 10.0)
                                        .frame(width: 340, height: 45)
                                        .background(Color.clear)
                                        .foregroundColor(.white)
                                }
                                if dateFormatter.string(from: selectedBirthDate).isEmpty{
                                    Text("Please select date of birth").font(.footnote)
                                        .foregroundColor(.red)
                                        .position(x:265, y: -5)
                                }
                            }
                            .position(x: 170, y: 0)
   
                            .popover(isPresented: $isBirthDatePickerVisible, arrowEdge: .bottom) {
                                VStack {
                                    DatePicker("", selection: $selectedBirthDate, in: ...Date(), displayedComponents: .date)
                                        .datePickerStyle(GraphicalDatePickerStyle())
                                        .frame(maxHeight: 400)
                                    
                                    Button("Done") {
                                        isBirthDatePickerVisible = false
                                    }
                                    .padding()
                                }
                                .background(Color.white)
                                .cornerRadius(10)
                            }
                            
                        }
                    }
                    .frame(width: 350, height: 80)
                    .border(width: 0.5, edges: [.bottom], color: .white)
                    .position(x: 195, y: 175)
                    
                    VStack{
                        VStack{
                            Text("Anniversary")
                                .position(x: 55, y: 10)
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.white)
                            
                            VStack {
                                Button(action: {
                                    isAnniDatePickerVisible.toggle()
                                }) {
                                    Text(dateFormatter.string(from: selectedAnniversaryDate))
                                        .frame(width: 340, height: 45)
                                        .background(Color.clear)
                                        .foregroundColor(.white)
                                }
                                if dateFormatter.string(from: selectedAnniversaryDate).isEmpty{
                                    Text("Please select anniversary date").font(.footnote)
                                        .foregroundColor(.red)
                                        .position(x:250, y: -5)
                                }
                            }
                            .position(x: 170, y: 0)
                            
                            .popover(isPresented: $isAnniDatePickerVisible, arrowEdge: .bottom) {
                                VStack {
                                    DatePicker("Enter your Anniversary", selection: $selectedAnniversaryDate, in: ...Date(), displayedComponents: .date)
                                        .datePickerStyle(GraphicalDatePickerStyle())
                                        .frame(maxHeight: 400)
                                    
                                    Button("Done") {
                                        isAnniDatePickerVisible = false
                                    }
                                    .padding()
                                }
                                .background(Color.white)
                                .cornerRadius(10)
                            }
                            
                        }
                    }
                    .frame(width: 350, height: 80)
                    .border(width: 0.5, edges: [.bottom], color: .white)
                    .position(x: 195, y: 180)
                    
                    VStack{
                        VStack{
                            Text("Address")
                                .position(x: 40, y: 10)
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.white)
                            EditTextField(placeholder: "Address", text: $address)
                                .position(x: 170, y: 0)
                            
                            if address.isEmpty{
                                Text("Please enter address").font(.footnote)
                                    .foregroundColor(.red)
                                    .position(x:285, y: -5)
                            }
                        }
                    }
                    .frame(width: 350, height: 95)
                    .border(width: 0.5, edges: [.bottom], color: .white)
                    .position(x: 195, y: 190)
                    
                    
                    VStack{
                        VStack{
                            Text("State")
                                .position(x: 28, y: 10)
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.white)
                            EditTextField(placeholder: "State", text: $state)
                                .position(x: 170, y: 0)
                            
                            if state.isEmpty{
                                Text("Please enter state").font(.footnote)
                                    .foregroundColor(.red)
                                    .position(x:285, y: -5)
                            }
                        }
                    }
                    .frame(width: 350, height: 80)
                    .border(width: 0.5, edges: [.bottom], color: .white)
                    .position(x: 195, y: 195)
                    
                    VStack{
                        VStack{
                            VStack{
                                Text("City")
                                    .position(x: 20, y: 10)
                                    .font(.system(size: 15, weight: .light))
                                    .foregroundColor(.white)
                                EditTextField(placeholder: "City", text: $city)
                                    .position(x: 170, y: 0)
                                if city.isEmpty{
                                    Text("Please enter city").font(.footnote)
                                        .foregroundColor(.red)
                                        .position(x:285, y: -5)
                                }
                            }
                        }
                        .frame(width: 350, height: 80)
                        .border(width: 0.5, edges: [.bottom], color: .white)
                        .position(x: 195, y: 200)
                        
                        VStack{
                            VStack{
                                Text("Compnay Name")
                                    .position(x: 65, y: 10)
                                    .font(.system(size: 15, weight: .light))
                                    .foregroundColor(.white)
                                EditTextField(placeholder: "Company Name", text: $company)
                                    .position(x: 175, y: 0)
                                if company.isEmpty{
                                    Text("Please enter company name").font(.footnote)
                                        .foregroundColor(.red)
                                        .position(x:250, y: -5)
                                }
                            }
                        }
                        .frame(width: 350, height: 80)
                        .border(width: 0.5, edges: [.bottom], color: .white)
                        .position(x: 195, y: 205)
                        
                        VStack{
                            VStack{
                                Text("GST")
                                    .position(x: 20, y: 10)
                                    .font(.system(size: 15, weight: .light))
                                    .foregroundColor(.white)
                                EditTextField(placeholder: "GST", text: $gst)
                                    .position(x: 170, y: 0)
                                if gst.isEmpty{
                                    Text("Please enter GST").font(.footnote)
                                        .foregroundColor(.red)
                                        .position(x:285, y: -5)
                                }
                            }
                        }
                        .frame(width: 350, height: 80)
                        .border(width: 0.5, edges: [.bottom], color: .white)
                        .position(x: 195, y: 210)
                        
                        VStack{
                            VStack{
                                Text("PAN")
                                    .position(x: 20, y: 10)
                                    .font(.system(size: 15, weight: .light))
                                    .foregroundColor(.white)
                                EditTextField(placeholder: "PAN", text: $pan)
                                    .position(x: 170, y: 0)
                                if pan.isEmpty{
                                    Text("Please enter PAN").font(.footnote)
                                        .foregroundColor(.red)
                                        .position(x:285, y: -5)
                                }
                            }
                        }
                        .frame(width: 350, height: 80)
                        .position(x: 195, y: 215)
                    }
                    
                    
                    VStack{
                        Text("ghg")
                            .frame(width: 100, height: 200)
                        
                    }.position(x: 195, y: 600)
                    
                    
                }// ScrollView
                
            }.onTapGesture {
                hideKeyboard()
               
            }.onAppear{
                
//                checkDetails()
//                let savedText = UserDefaults.standard.object(forKey: "id") as! Int
//                       do
//                       {
//                         
//                           self.userStatusId = savedText
//                           print("Get id: ", userStatusId)
//                       }
//                getUserData()
                getDataFromDatabase()
            }
               
//                }//Zstack
        }
        .navigationBarBackButtonHidden(true)
//        .navigationBarBackButtonHidden(true)//NavigationStack
//        .navigationTitle("Navigation")
//        .navigationBarTitleDisplayMode(.inline)
    }//body
    
    func getDataFromDatabase(){
        self.userData = db.readUserData()
     
        if let sqlData = self.userData.first{
            name = sqlData.fullName!
            mobileNumber = sqlData.phoneNumber!
            address = sqlData.address!
            state = sqlData.state!
            city = sqlData.cityName!
            company = sqlData.companyName!
            gst = sqlData.gst!
            pan = sqlData.pan!
        }
    }
    
    func saveData(){
        
        self.db.updateUserData(fullName: name, phoneNumber: mobileNumber, companyName: company, cityName: city, state: state, address: address, gst: gst, pan: pan)
    }
    
    func checkDetails() {
            
        let body: [String: Any] = ["id":userStatusId]
            
            let jsonData = try? JSONSerialization.data(withJSONObject: body)
            
            //  "https://flaskcontact-list-app.herokuapp.com/contacts"
            let url = URL(string: "https://alemac.logthis.in/api/UserAPI/GetUserData/")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("\(String(describing: jsonData?.count))", forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                print("-----> data: \(data!)")
                print("-----> error: \(error)")
                
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    return
                }
                
                let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
                print("-----1> responseJSON: \(responseJSON!)")
                    if let responseJSON = responseJSON as? [String:Any] {
                        let responseData = responseJSON["data"] as? [String: Any]
                        
//                        name = (responseData!["fullName"]! as? String)!
                }
            }
            task.resume()
        }
    
    func getUserData() {
        let headers = HTTPHeaders(["Content-Type": "application/json"])
        //        let userData = UserStatusPostModels(id: "601")
        AF.request("https://alemac.logthis.in/api/UserAPI/GetUserData/", method: .post, parameters: ["id": 657],encoding: JSONEncoding.default, headers: headers)
            .validate(statusCode: 200 ..< 600)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        do {
                            let decoder = JSONDecoder()
                            let userData = try decoder.decode(GetUserDatatModels.self, from: data)
//                            print("USERDATA:", userData.data!)
                            DispatchQueue.main.async {
                                                     if let dataArray = userData.data {
//                                                         self.userDataArray = userData.data
//                                                         self.profileDataResponse = dataArray
//                                                         print(dataArray.fullName!) ??
//                                                         name = dataArray.fullName ?? ""
//                                                         mobileNumber = dataArray.phoneNumber ?? ""
////                                                         selectedBirthDate =  dateFormatter.date(from: dataArray.dob!) ?? ""
////                                                         let strtodate = selectedAnniversaryDate as! String
////                                                         print(strtodate)
////                                                         selectedAnniversaryDate = dateFormatter.date(from: dataArray.anniversaryDate!) ?? dateFormatter.date(from: "")!
////                                                         if (dataArray.anniversaryDate != ""){
////                                                             selectedAnniversaryDate = dateFormatter.date(from: dataArray.anniversaryDate!)!
////                                                             let strtodate = selectedAnniversaryDate as! String
////                                                             print(strtodate)
////                                                         }
//                                                         address = dataArray.address ?? ""
//                                                         state = dataArray.state ?? ""
//                                                         city = dataArray.cityName ?? ""
//                                                         company = dataArray.companyName ?? ""
//                                                         gst = dataArray.gst ?? ""
//                                                         pan = dataArray.pan ?? ""
//                                                         print("--- ", dataArray.fullName!)
                                                         
                                                         
//                                                         self.db.deleteUserDataByID(id: (userData.data?.id)!)
//                                                         self.db.insertUserData(userData: userData)
                                                     
                                                         self.userData = db.readUserData()
                                                      
                                                         if let sqlData = self.userData.first{
                                                             name = sqlData.fullName!
                                                             mobileNumber = sqlData.phoneNumber!
                                                             address = sqlData.address!
                                                             state = sqlData.state!
                                                             city = sqlData.cityName!
                                                             company = sqlData.companyName!
                                                             gst = sqlData.gst!
                                                             pan = sqlData.pan!
                                                         }
                                                     } else {
                                                         print("Empty")
                                                         self.userDataArray = ["empty"]
                                                     }
                                                 }
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

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
