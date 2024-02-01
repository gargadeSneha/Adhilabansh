//
//  RegisterScreen.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 18/07/23.
//

import SwiftUI
import Combine
import Alamofire

struct FormError {
    var name: String = ""
    var mobNumber: String = ""
    var pinCode: String = ""
    var gst: String = ""
    var pan: String = ""
    var dateOfBirth: String = ""
    var address: String = ""
    var state: String = ""
    var city: String = ""
    var company: String = ""
    var distribution: String = ""
    var adharNumber: String = ""
}

struct RegisterScreen: View {
    
    @State private var db:DB_Manager = DB_Manager()
    @State private var formError = FormError()
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
    @State private var isSelected = false
    @State private var selectedUserRole = 5
    @State private var frontAdharCameraSelected = false
    @State private var selectedBirthDate = Date()
    @State private var selectedAnniversaryDate =  Date()
    @State private var date = Date.now
    @State private var isBirthDatePickerVisible = false
    @State private var isAnniDatePickerVisible = false
    @State private var selectedOption: DropdownOption?
    @State private var userStatusId: Int = 0
  
    //validation
    @State private var isNameValid: Bool = true
    @State private var isPhoneNumberValid: Bool = true
    @State private var isPinCodeNumberValid: Bool = true
    @State private var isGstNumberValid: Bool = true
    @State private var isPanNumberValid: Bool = true
    @State private var ismobileTFEmpty: Bool = false
    
    //MaxLength
    private let maxLengthMob = 10
    private let maxLengthPinCode = 6
    private let maxLengthPan = 10
    private let maxLengthGst = 15
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
           formatter.dateFormat = "dd/MM/yyyy"
           return formatter
       }
    
    var isFormEmpty: Bool {
        if !name.isEmpty{
            formError.name = ""
        }
        if !mobileNumber.isEmpty{
            formError.mobNumber = ""
        }
        if !DateOfBirth.isEmpty{
            formError.dateOfBirth = ""
        }
        if !address.isEmpty{
            formError.address = ""
        }
        if !state.isEmpty{
            formError.state = ""
        }
        if !city.isEmpty{
            formError.city = ""
        }
        if !pincode.isEmpty{
            formError.pinCode = ""
        }
        if !company.isEmpty{
            formError.company = ""
        }
        if !gst.isEmpty{
            formError.gst = ""
        }
        if !pan.isEmpty{
            formError.pan = ""
        }
        if !distribution.isEmpty{
            formError.distribution = ""
        }
        
        return !name.isEmpty && !mobileNumber.isEmpty  && !DateOfBirth.isEmpty && !address.isEmpty && !state.isEmpty && !city.isEmpty && !pincode.isEmpty && gst.isEmpty && pan.isEmpty && company.isEmpty && !distribution.isEmpty && !adharNumber.isEmpty
    }

    var isFormValid: Bool {
        if name.isEmpty{
            formError.name = "Please enter name"
        }
        if mobileNumber.isEmpty{
            formError.mobNumber = "Please enter Mobile Numuber"
        }
        if address.isEmpty{
            formError.address = "Please enter Address"
        }
        if gst.isEmpty{
            formError.gst = "Please enter GST"
        }
        if state.isEmpty{
            formError.state = "Please enter State"
        }
        if city.isEmpty{
            formError.city = "Please enter City"
        }
        if pan.isEmpty{
            formError.pan = "Please enter PAN"
        }
        if pincode.isEmpty{
            formError.pinCode = "Please enter Pincode"
        }
        if DateOfBirth.isEmpty{
            formError.dateOfBirth = "Please select date of birth"
        }
        if company.isEmpty{
            formError.company = "Please enter Company name"
        }
        if distribution.isEmpty{
            formError.distribution = "Please enter Distribution"
        }
        if adharNumber.isEmpty{
            formError.adharNumber = "Please enter adhar Number"
        }
      
        return !name.isEmpty && !mobileNumber.isEmpty  && !DateOfBirth.isEmpty && !address.isEmpty && !state.isEmpty && !city.isEmpty && !pincode.isEmpty && gst.isEmpty && pan.isEmpty && company.isEmpty && !distribution.isEmpty && !adharNumber.isEmpty
    }
    
 
    let dropDownData: [[String: Any]] = [
      
          [
              "userId": 5,
              "data": "Distributor"
          ],
          [
              "userId": 6,
              "data": "Retailer"
          ],
          [
              "userId": 7,
              "data": "Electrician"
          ],
          [
              "userId": 8,
              "data": "Customer"
          ]
      ]
    
    
    enum DropdownOption: String, CaseIterable, Identifiable {
         case retailer
         case electrician
         case customer
         case distributor
        
         var id: String { self.rawValue }
     }
    
    var selectionTitle: String {
          selectedOption?.rawValue.capitalized ?? dropDownData[0]["data"] as? String ?? ""
      }
    
    
    var body: some View {
        NavigationView{
            
            ZStack{
                Image("Group_308")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .edgesIgnoringSafeArea(.bottom)
                ScrollView{
                    
                    VStack (spacing: 20){
                        Text("REGISTATION").bold()
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .position(x: 195, y: 85)
                    }
                    
                    VStack{
                        Text("Name*")
                            .position(x: 55, y: 130)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        CustomTextField(placeholder: "", text: $name)
                            .onChange(of: name) { newValue in
                                if isFormEmpty{
                                    
                                }
                            }
                        if !formError.name.isEmpty{
                            Text(formError.name)
                                .font(.footnote)
                                .foregroundColor(.red)
                                .position(x:315, y: 130)
                        }
                    }
                    
                    VStack{
                        Text("Mobile Number*")
                            .position(x: 95, y: 133)
                            .font(.system(size: 18))
                            .foregroundColor(.white)

                        CustomTextField(placeholder: "", text: $mobileNumber)
                            .onChange(of: mobileNumber) { newValue in
                                if newValue.count > maxLengthMob {
                                    mobileNumber = String(newValue.prefix(maxLengthMob))
                                }
                                        if isFormEmpty{
                                            
                                        }
                                                // Perform phone number validation using regular expression
                                                let phoneNumberRegex = "^[0-9]{10}$"
                                                let regexTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
                                                isPhoneNumberValid = regexTest.evaluate(with: newValue)
                                            }
                                          .foregroundColor(isPhoneNumberValid ? .black : .red) 
                        
                        if !formError.mobNumber.isEmpty{
                            Text(formError.mobNumber)
                                .font(.footnote)
                                .foregroundColor(.red)
                                .position(x:285, y: 130)
                        }
                        else if !isPhoneNumberValid{
                            Text("Please enter valid mobile number")
                                .font(.footnote)
                                .foregroundColor(.red)
                                .position(x: 265, y: 130)
                        }

                    }
                    VStack{
                        Text("Role*")
                            .position(x: 51, y: 133)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        
                        HStack{
                            Button(action: { isSelected.toggle()}) {
                                HStack {
                                    Text(selectionTitle).padding(10)
                                        .foregroundColor(.black).frame(width: 110, alignment: .leading)
                                    Image(isSelected ? "DropDown" : "downarrow")
                                        .padding(.leading, 190)
                                    Spacer()
                                }
                            }
                            
                            
                        }.frame(width: 340, height: 45)// Hstack
                            .background(Color.white)
                            .cornerRadius(5)
                            .position(x: 200, y: 145)

                    }// Role Vstack
                    
                    if selectedUserRole == 6 {
                        VStack{
                            Text("My Distributor*")
                                .position(x: 90, y: 133)
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                            
                        
                            CustomTextField(placeholder: "", text: $DateOfBirth)
                                .onChange(of: distribution) { newValue in
                                    if isFormEmpty{
                                        
                                    }
                                }
                            if !formError.distribution.isEmpty{
                                Text(formError.distribution)
                                    .font(.footnote)
                                    .foregroundColor(.red)
                                    .position(x:292, y: 130)
                            }
     
                        }
                    }
                    
                    VStack{
                        Text(selectedUserRole == 8 ? "Date of Birth*":"Date of Birth")
                            .position(x: 83, y: 133)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        
                        VStack {
                            Button(action: {
                                isBirthDatePickerVisible.toggle()
                            }) {
                                Text(dateFormatter.string(from: selectedBirthDate))
                                    .padding(.leading, 10.0)
                                    .frame(width: 339, height: 45, alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .foregroundColor(.black)
                            }
                        }
                        .position(x: 200, y: 145)

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
                    VStack{
                        Text("Anniversary")
                            .position(x: 75, y: 133)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        
                        VStack {
                            Button(action: {
                                isAnniDatePickerVisible.toggle()
                            }) {
                                Text(dateFormatter.string(from: selectedAnniversaryDate))
                                    .frame(width: 330, height: 45, alignment: .leading)
                                    .padding(.leading, 10)
                                    .background(Color.white)
                                    .cornerRadius(5)
                                    .foregroundColor(.black)
                            }
                            
                        }
                        .position(x: 200, y: 145)
                        
                        .popover(isPresented: $isAnniDatePickerVisible, arrowEdge: .bottom) {
                            VStack {
                                DatePicker("Enter your birthday", selection: $selectedAnniversaryDate, in: ...Date(), displayedComponents: .date)
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                    .background(.red)
                                
                                Button("Done") {
                                    isAnniDatePickerVisible = false
                                }
                                .padding()
                            }
                            .background(Color.white)
                            .cornerRadius(10)
                        }
                    }
                    VStack{
                        Text(selectedUserRole == 8 ? "Address":"Address*")
                            .position(x: 65, y: 133)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                       CustomTextField(placeholder: "Address", text: $address)
                            .onChange(of: address) { newValue in
                                if isFormEmpty{
                                    
                                }
                            }
                        if selectedUserRole == 5 || selectedUserRole == 6 || selectedUserRole == 7 {
                            if !formError.address.isEmpty{
                                Text(formError.address)
                                    .font(.footnote)
                                    .foregroundColor(.red)
                                    .position(x:302, y: 130)
                            }
                        }
                    }
                    VStack{
                        Text(selectedUserRole == 8 ? "State":"State*")
                            .position(x: 52, y: 133)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                        CustomTextField(placeholder: "State", text: $state)
                            .onChange(of: state) { newValue in
                                if isFormEmpty{
                                    
                                }
                            }
                        if selectedUserRole == 5 || selectedUserRole == 6 || selectedUserRole == 7 {

                            if !formError.state.isEmpty{
                                Text(formError.state)
                                    .font(.footnote)
                                    .foregroundColor(.red)
                                    .position(x:310, y: 130)
                            }
                        }
                    }
                    
                    
                    VStack{
                        VStack{
                            Text(selectedUserRole == 8 ? "City":"City*")
                                .position(x: 50, y: 133)
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                            CustomTextField(placeholder: "City", text: $city)
                                .onChange(of: city) { newValue in
                                    if isFormEmpty{
                                        
                                    }
                                }
                            if selectedUserRole == 5 || selectedUserRole == 6 || selectedUserRole == 7 {
                                if !formError.city.isEmpty{
                                    Text(formError.city)
                                        .font(.footnote)
                                        .foregroundColor(.red)
                                        .position(x:315, y: 130)
                                }
                            }
                        }
                        VStack{
                            Text(selectedUserRole == 8 ? "Pincode":"Pincode*")
                                .position(x: 65, y: 133)
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                            
                            CustomTextField(placeholder: "Pincode", text: $pincode)
                                .onChange(of: pincode) { newValue in
                                    if newValue.count > maxLengthMob {
                                        pincode = String(newValue.prefix(maxLengthMob))

                                    }
                                    if isFormEmpty{
                                        
                                    }
                                                    // Perform phone number validation using regular expression
                                                    let pinCodeNumberRegex = "^[0-9]{6}$"
                                                    let regexTest = NSPredicate(format: "SELF MATCHES %@", pinCodeNumberRegex)
                                                    isPinCodeNumberValid = regexTest.evaluate(with: newValue)
                                                }

                                              .foregroundColor(isPinCodeNumberValid ? .black : .red)   // Change text
                          
                            if !pincode.isEmpty && !isPinCodeNumberValid {
                                    Text("Please enter valid Pincode")
                                        .font(.footnote)
                                        .foregroundColor(.red)
                                        .position(x: 266, y: 130)
                                }
                            
                            if selectedUserRole == 5 || selectedUserRole == 6 || selectedUserRole == 7 {

                                if !formError.pinCode.isEmpty{
                                    Text(formError.pinCode)
                                        .font(.footnote)
                                        .foregroundColor(.red)
                                        .position(x:300, y: 130)
                                }
                            }
                        }
                        if selectedUserRole == 7 || selectedUserRole == 8 {
                            VStack{
                                Text("KYC Details").bold()
                                    .position(x: 85, y: 140)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    .padding(.top, 20)
                            }
                            
                            VStack{
                                Text("Adhar Number")
                                    .position(x: 91, y: 140)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                    .padding(.bottom,10)
                                CustomTextField(placeholder: "", text: $adharNumber)
                                    .onChange(of: adharNumber) { newValue in
                                        if isFormEmpty{
                                            
                                        }
                                    }
                            }
                            HStack{
                                HStack{
                                    Text("Front")
                                        .position(x: 75, y: 140)
                                        .font(.system(size: 15))
                                        .foregroundColor(.white)
                                        .padding(.top, 20)
                                    
                                    Button(action: {
                                        frontAdharCameraSelected.toggle()
                                    }){
                                        Image("Camera_icon")
                                    }.frame(width: 50)
                                        .position(x: 30, y: 160 )
                                        .padding(.bottom, 20)
                                }
                                
                                HStack{
                                    Text("Back")
                                        .position(x: 45, y: 140)
                                        .font(.system(size: 18))
                                        .foregroundColor(.white)
                                        .padding(.top, 20)
                                    Button(action: {
                                        
                                        frontAdharCameraSelected.toggle()
                                    }){
                                        Image("Camera_icon")
                                    }.frame(width: 50)
                                        .position(x: 3, y: 160 )
                                }
                            }
                            
                        }
                        
                        
                        if selectedUserRole == 5 || selectedUserRole == 6
                        {
                            VStack{

                                Text("Company Name*")
                                    .position(x: 95, y: 133)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                CustomTextField(placeholder: "Company", text: $company)
                                    .onChange(of: company) { newValue in
                                        if isFormEmpty{

                                        }
                                    }

                                if selectedUserRole == 6 || selectedUserRole == 5 {
                                    if !formError.company.isEmpty{
                                        Text(formError.company)
                                            .font(.footnote)
                                            .foregroundColor(.red)
                                            .position(x:280, y: 130)
                                    }

                                }
                            }
                            VStack{
                                Text("GST*")
                                    .position(x: 50, y: 133)
                                    .font(.system(size: 18))
                                    .foregroundColor(.white)
                                CustomTextField(placeholder: "GST", text: $gst)
                                    .onChange(of: gst) { newValue in
                                        if isFormEmpty{

                                        }
                                    }
                                if selectedUserRole == 6 || selectedUserRole == 5 {
                                    if !formError.gst.isEmpty{
                                        Text(formError.gst)
                                            .font(.footnote)
                                            .foregroundColor(.red)
                                            .position(x:315, y: 130)
                                    }
                                }

                            }
                        }
                        
                        VStack{
                            Text(selectedUserRole == 6 || selectedUserRole == 5 ? "PAN Number*":"PAN Number")
                                .position(x: 85, y: 133)
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                            PanTextField(placeholder: "", text: $pan)
                                .onChange(of: pan) { newValue in
                                    if isFormEmpty{

                                    }
                                }
                            if  selectedUserRole == 6 || selectedUserRole == 5 {
                                if !formError.pan.isEmpty{
                                    Text(formError.pan)
                                        .font(.footnote)
                                        .foregroundColor(.red)
                                        .position(x:315, y: 130)
                                }
                            }
                        }
                        
                        NavigationLink(destination: Profile())
                        {
                            Text("Register")
                                .frame(width: 290, height: 50)
                                .background(.red)
                                .font(.system(size: 18))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .position(x: 200, y: 25)
                                .onTapGesture {
//                                    registerAPI()
                              resgisterBtnTapped()
                                    if isFormValid{
                                        print("gggg")
                                        
                                    }
                                }
                        }.buttonStyle(PlainButtonStyle())
                            .position(x: 200, y:170)

                        NavigationLink(destination: ContentView())
                        {
                            Text("Go to Login").underline()
                                .font(.system(size: 13))
                                .foregroundColor(.white)
                                .position(x: 200, y: 25)

                        }.buttonStyle(PlainButtonStyle())
                            .position(x: 200, y:140)
 
                        if isSelected {
                            VStack(alignment: .leading){
                                Color.white
                                Button(action: {
                                    selectedOption = .retailer
                                    selectedUserRole = dropDownData[1]["userId"] as! Int
                                    isSelected.toggle()
                                    print(selectedUserRole)
                                }){
                                    Text(dropDownData[1]["data"] as? String ?? "") .frame(width: 320, height: 51, alignment: .leading)
                                        .padding(10)
                                        .foregroundColor(.black)
                                }
                                
                                Button(action: {
                                    selectedOption = .electrician
                                    selectedUserRole = dropDownData[2]["userId"] as! Int
                                    isSelected.toggle()
                                    print(selectedUserRole)
                                }){
                                    Text(dropDownData[2]["data"] as? String ?? "").frame(width: 320, height: 51, alignment: .leading)
                                        .padding(10)
                                        .foregroundColor(.black)
                                }
                                
                                Button(action: {
                                    selectedOption = .distributor
                                    selectedUserRole = dropDownData[0]["userId"] as! Int
                                    isSelected.toggle()
                                    print(selectedUserRole)
                                }){
                                    Text(dropDownData[0]["data"] as? String ?? "").frame(width: 320, height: 51, alignment: .leading)
                                        .padding(10)
                                        .foregroundColor(.black)
                                }
                                
                                Button(action: {
                                    selectedOption = .customer
                                    selectedUserRole = dropDownData[3]["userId"] as! Int
                                    isSelected.toggle()
                                    print(selectedUserRole)
                                }){
                                    Text(dropDownData[3]["data"] as? String ?? "").frame(width: 320, height: 51, alignment: .leading)
                                        .padding(10)
                                        .foregroundColor(.black)
                                }
                                Spacer()
                            }.background(.white)
                                .cornerRadius(5)
                                .frame(width: 200, height:150)
                                .position(x: 200, y: selectedUserRole == 5 ? -535 : selectedUserRole == 6 ? -615: -591 )
                            
                        }
                        
                        Text("").frame(width: 400, height: 200)
                    }
                }
            }
    
        }
        .navigationBarBackButtonHidden(true) //navigationview
        
    }//body
    
    
    func resgisterBtnTapped() {
        self.db.insertRegUserData(fullName: name, phoneNumber: mobileNumber, companyName: company, cityName: city, state: state, address: address, gst: gst, pan: pan)
    }
    
    func registerAPI() {
        print("dgffd")
        let register = RegisterModels(UserName: "", fullName: name, password: "", phoneNumber: mobileNumber, companyName: company, dob: dateFormatter.string(from: selectedBirthDate), anniversaryDate: dateFormatter.string(from: selectedAnniversaryDate), city: city, state: state, pincode: pincode, address: address, GST: gst, PAN: pan, PanPhotoPath: "", ProfilePicture: "", profilePictureName: "", profilePictureExtention: "", roleId: 8, deviceID: "6058e034c6c22651", BankAccountNumber: "", IFSC: "", AadharNumber: "", AadharPhotoPath: "")
        
        let headers = ["Content-Type": "application/json"]
        
        AF.request("https://alemac.logthis.in/api/UserAPI/Register/", method: .post, parameters: register.toParameters(), encoding: JSONEncoding.default, headers: ["Content-Type": "application/json"]).validate(statusCode: 200 ..< 600)
        
            .responseJSON { response in
                switch response.result {
                case .success(let data):
                    print("Register responce: ", data )
//                    checkDetails()

                    
                case .failure(let error):
                    
                    print("POST Request Error:", error)
                }
            }
    }
    
    func checkDetails() {
            
        let body: [String: Any] = ["fullName": name, "phoneNumber": mobileNumber, "companyName": company, "dob": dateFormatter.string(from: selectedBirthDate), "anniversaryDate": dateFormatter.string(from: selectedAnniversaryDate), "city": city, "state": state, "pincode": pincode, "address": address, "GST": gst, "PAN": pan, ]
            
            let jsonData = try? JSONSerialization.data(withJSONObject: body)
            
            //  "https://flaskcontact-list-app.herokuapp.com/contacts"
            let url = URL(string: "https://alemac.logthis.in/api/UserAPI/Register/")!
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
                      

                        userStatusId = (responseData!["id"]! as? Int)!
                        print("id: ",userStatusId)
                        UserDefaults.standard.set(userStatusId, forKey: "id")
                        let savedText = UserDefaults.standard.object(forKey: "id") as! Int
                        print("UserDefault id: ", savedText)
                }
            }
            
            task.resume()
        }
}//struct

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}


