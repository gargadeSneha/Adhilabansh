//
//  ContentView.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 12/07/23.
//
// http://10.100.0.25:7850/
// https://alemac.logthis.in/

import SwiftUI
import CoreData
import Alamofire

// MARK: - Encode/decode helpers (by using this we can handle JSONNULL i.e nill value in entire project )
class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


// MARK: - Login Model
class Login: Codable {
    let loginModels: LoginModels?

    init(loginModels: LoginModels?) {
        self.loginModels = loginModels
    }
}
struct LoginModels: Codable {
    var deviceID: String?
    var phoneNumber: String?
    let accessMember: AccessMember?

    enum CodingKeys: String, CodingKey {
        case phoneNumber
        case deviceID = "DeviceID"
        case accessMember = "AccessMember"
    }

    init(phoneNumber: String?, deviceID: String?, accessMember: AccessMember?) {
        self.phoneNumber = phoneNumber
        self.deviceID = deviceID
        self.accessMember = accessMember
    }

}

// MARK: - AccessMember
class AccessMember: Codable {
    var id: Int?
    var userID: Int?
    var url: String?
    var referrerURL: String?
    var port: String?
    var host: String?
    var RemoteHost: String?
    var RemoteAddrIP: String?
    var useragent: String?
    let browserType: String?
    var browserVersion: String?
    var platform: String?
    var clickedBy: String?
    var statusID: Int?
    var DeviceName: String?
    var OperatingSystem: String?
    var DeviceType: String?
    var DeviceModel: String?
    var Build: String?
    var Version: String?
    var roleID: Int?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case userID = "UserID"
        case url = "Url"
        case referrerURL = "ReferrerURL"
        case port = "Port"
        case host = "Host"
        case RemoteHost = "RemoteHost"
        case RemoteAddrIP = "RemoteAddrIP"
        case useragent = "Useragent"
        case browserType = "BrowserType"
        case browserVersion = "BrowserVersion"
        case platform = "Platform"
        case clickedBy = "ClickedBy"
        case statusID = "StatusID"
        case DeviceName = "DeviceName"
        case OperatingSystem = "OperatingSystem"
        case DeviceType = "DeviceType"
        case DeviceModel = "DeviceModel"
        case Build = "Build"
        case Version = "Version"
        case roleID = "RoleID"

    }

    init(
        id: Int?,
        userID: Int?,
        url: String?,
        referrerURL: String?,
        port: String?,
        host: String?,
        RemoteHost: String?,
        RemoteAddrIP: String?,
        useragent: String?,
        browserType: String?,
        browserVersion: String?,
        platform: String?,
        clickedBy: String?,
        statusID: Int?,
        DeviceName: String?,
        OperatingSystem: String?,
        DeviceType: String?,
        DeviceModel: String?,
        Build: String?,
        Version: String?,
        roleID: Int?) {
            self.id = id
            self.userID = userID
            self.url = url
            self.referrerURL = referrerURL
            self.port = port
            self.host = host
            self.RemoteHost = RemoteHost
            self.RemoteAddrIP = RemoteAddrIP
            self.useragent = useragent
            self.browserType = browserType
            self.browserVersion = browserVersion
            self.platform = platform
            self.clickedBy = clickedBy
            self.statusID = statusID
            self.DeviceName = DeviceName
            self.OperatingSystem = OperatingSystem
            self.DeviceType = DeviceType
            self.DeviceModel = DeviceModel
            self.Build = Build
            self.Version = Version
            self.roleID = roleID
        }
}

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var userDefMoblieNumber: String = ""
    @State private var moblieNumber: String = ""
    
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
                    
                    Text("Mobile Number")
                        .position(x: 90, y: 450)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                    
                    TextField("Enter your password", text: $moblieNumber)
                        .padding(.horizontal, 10.0)
                        .frame(width: 340, height: 45)
                        .background(Color.white)
                        .cornerRadius(5)
                        .position(x: 195, y: 305)
                    
                    HStack{
                        Text("Don't have an account ? ")
                            .position(x: 167, y: 230)
                            .font(.system(size: 12))
                            .foregroundColor(.white)
                        
                        NavigationLink(destination: RegisterScreen()) {
                            Text("Register")
                                .font(.system(size: 12))
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .position(x: 61, y: 230)
                        }.buttonStyle(PlainButtonStyle())
                    }
          
                    
                    
                    NavigationLink(destination: OTPScreen()) {
                        Text("Continue")
                            .frame(width: 290, height: 50)
                            .background(.red)
                            .font(.system(size: 18))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .position(x: 195, y: -15)
                            .onTapGesture {
//                                  postMethod()
                                UserDefaults.standard.set(moblieNumber, forKey: "phoneNo")
                                let savedText = UserDefaults.standard.object(forKey: "phoneNo") as! String
                                print("phoneNo: ", savedText)
                                
                            }
                        
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    //    func loginApiCall(moblieNumber: String) {
    //        guard let url = URL(string: "http://10.100.0.25:7850/api/UserAPI/Login/") else{return}
    //
    //        let body: [String: Any] = ["DeviceID": "D2EDFAF2-4EC3-460A-ACBF-5F5C43DF5B11",
    //                                      "phoneNumber": moblieNumber,
    //                                          "id": 0,
    //                                          "userID": 0,
    //                                          "url": "",
    //                                          "referrerURL": "",
    //                                          "port": "",
    //                                          "host": "",
    //                                          "RemoteHost": "",
    //                                          "RemoteAddrIP": "",
    //                                          "useragent": "",
    //                                          "browserType": "",
    //                                          "browserVersion": "",
    //                                          "platform": "Android",
    //                                          "clickedBy": "",
    //                                          "statusID": 0,
    //                                          "DeviceName": "iPhone 13",
    //                                          "OperatingSystem": "16.2",
    //                                          "DeviceType": "iOS",
    //                                          "DeviceModel": "iPhone 13",
    //                                          "Build": "28",
    //                                          "Version": "1.0",
    //                                          "roleID": 0
    //                                      ]
    //        var request = URLRequest(url: url)
    //        request.httpMethod = "POST"
    //        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    //
    //        let data = try! JSONSerialization.data(withJSONObject: body)
    //        request.httpBody = data
    //        print(body)
    //        URLSession.shared.dataTask(with: request) { data, response, error in
    //            if let error = error {
    //                print(error.localizedDescription)
    //            }
    //            do{
    //                if let data = data{
    ////                    let json = try! JSONDecoder().decode(Welcome.self, from: data)
    ////                    print(json)
    //                    print(data)
    //                }
    //            }
    //        }.resume()
    //    }
    
// MARK: - API call using Alamofire
    func postMethod() {
        print("dgffd")
        let accessMember = AccessMember(id: 0, userID: 0, url: "", referrerURL: "", port: "", host: "", RemoteHost: "", RemoteAddrIP: "", useragent: "", browserType: "", browserVersion: "", platform: "Android", clickedBy: "", statusID: 0, DeviceName: "iPhone 13", OperatingSystem: "16.2", DeviceType: "iOS", DeviceModel: "iPhone 13", Build: "28", Version: "1.0", roleID: 0)
        let login = LoginModels(phoneNumber: moblieNumber, deviceID: "D2EDFAF2-4EC3-460A-ACBF-5F5C43DF5B11", accessMember: accessMember)
        
        let headers = ["Content-Type": "application/json"]
        
        AF.request("https://alemac.logthis.in/api/UserAPI/Login/", method: .post, parameters: login.toParameters(), encoding: JSONEncoding.default, headers: ["Content-Type": "application/json"]).validate(statusCode: 200 ..< 600).responseData { response in
            // print(response)
            switch response.result {
                
            case .success(let data):
                do {
                    guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                        print("Error: Cannot convert data to JSON object")
                        return
                    }
                    guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                        print("Error: Cannot convert JSON object to Pretty JSON data")
                        return
                    }
                    guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                        print("Error: Could print JSON in String")
                        return
                    }
                    
                    print(prettyPrintedJson)
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            case .failure(let error):
                print("=== ",error)
            }
        }
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
extension Encodable {
    func toParameters() -> Parameters? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Parameters
    }
}
