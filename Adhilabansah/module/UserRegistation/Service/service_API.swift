//
//  service_API.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 25/07/23.
//

import Foundation
class Register: Codable {
    let registerModels: RegisterModels?
    
    init(registerModels: RegisterModels?) {
        self.registerModels = registerModels
    }
}
struct RegisterModels: Codable {
          var UserName: String?
          var fullName: String?
          var password: String?
          var phoneNumber: String?
          var companyName: String?
          var dob: String?
          var anniversaryDate: String?
          var city: String?
          var state: String?
          var pincode: String?
          var address: String?
          var GST: String?
          var PAN: String?
          var PanPhotoPath: String?
          var ProfilePicture:String?
          var profilePictureName: String?
          var profilePictureExtention: String?
          var roleId: Int?
          var deviceID: String?
          var BankAccountNumber: String?
          var IFSC: String?
          var AadharNumber: String?
          var AadharPhotoPath: String?
    
    enum CodingKeys: String, CodingKey {
        case UserName = "UserName"
        case fullName = "FullName"
        case password = "Password"
        case phoneNumber = "PhoneNumber"
        case companyName = "CompanyName"
        case dob = "Dob"
        case anniversaryDate = "AnniversaryDate"
        case city = "city"
        case state = "state"
        case pincode = "pincode"
        case address = "address"
        case GST = "GST"
        case PAN = "PAN"
        case PanPhotoPath = "PanPhotoPath"
        case ProfilePicture = "ProfilePicture"
        case profilePictureName = "profilePictureName"
        case profilePictureExtention = "profilePictureExtention"
        case roleId = "roleId"
        case deviceID = "deviceID"
        case BankAccountNumber = "BankAccountNumber"
        case IFSC = "IFSC"
        case AadharNumber = "AadharNumber"
        case AadharPhotoPath = "AadharPhotoPath"
    }
    
    init(
        UserName: String?,
        fullName: String?,
        password: String?,
        phoneNumber: String?,
        companyName: String?,
        dob: String?,
        anniversaryDate: String?,
        city: String?,
        state: String?,
        pincode: String?,
        address: String?,
        GST: String?,
        PAN: String?,
        PanPhotoPath: String?,
        ProfilePicture: String?,
        profilePictureName: String?,
        profilePictureExtention: String?,
        roleId: Int?,
        deviceID: String?,
        BankAccountNumber: String?,
        IFSC: String?,
        AadharNumber: String?,
        AadharPhotoPath: String?
    ) {
            self.UserName = UserName
            self.fullName = fullName
            self.password = password
            self.phoneNumber = phoneNumber
            self.companyName = companyName
            self.dob = dob
            self.anniversaryDate = anniversaryDate
            self.city = city
            self.state = state
            self.pincode = pincode
            self.address = address
            self.GST = GST
            self.PAN = PAN
            self.PanPhotoPath = PanPhotoPath
            self.ProfilePicture = ProfilePicture
            self.profilePictureName = profilePictureName
            self.profilePictureExtention = profilePictureExtention
            self.roleId = roleId
            self.deviceID = deviceID
            self.BankAccountNumber = BankAccountNumber
            self.IFSC = IFSC
            self.AadharNumber = AadharNumber
            self.AadharPhotoPath = AadharPhotoPath
        }
    
}

//UserStatus
class UserStatus: Codable {
    let userStatusPostModels: UserStatusPostModels?
    let userStatusGetModel: UserStatusGetModels?
    
    init(userStatusPostModels: UserStatusPostModels?, userStatusGetModels: UserStatusGetModels?) {
        self.userStatusPostModels = userStatusPostModels
        self.userStatusGetModel = userStatusGetModels
    }
}
//Post
struct UserStatusPostModels: Codable {
    var id: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID"
    }
    init(
        id: String?
    ){
        self.id = id
    }
}

//Get
struct UserStatusGetModels: Codable {
        let isSuccess: Bool?
        let messageCaption, message, jsonMessageType, returnURL: String?
        let flag: String?
        let data: data

    
    enum CodingKeys: String, CodingKey {
        case isSuccess, messageCaption, message, jsonMessageType
        case returnURL = "returnUrl"
        case flag
        case data = "data"
    }
}

// MARK: - data
class data: Codable {
    var objectChanged: Bool?
    var id: Int?
    var userName: JSONNull?
    var fullName: JSONNull?
    var password: JSONNull?
    var alternateEmail: JSONNull?
    var phoneNumber: JSONNull?
    var companyName: JSONNull?
    var dob: JSONNull?
    var anniversaryDate: JSONNull?
    var city: JSONNull?
    var cityName: JSONNull?
    var state: JSONNull?
    var pincode: JSONNull?
    var address: JSONNull?
    var gst: JSONNull?
    var pan: JSONNull?
    var aadharNumber: JSONNull?
    var aadharPhotoPath: JSONNull?
    var panPhotoPath: JSONNull?
    var profilePicture: JSONNull?
    var approvedDate: JSONNull?
    var roleID: Int?
    var parentId: Int?
    var deviceID: JSONNull?
    var isVerified: Bool?
    var verficationCode: JSONNull?
    var verficationDate: JSONNull?
    var approvedByUserID: JSONNull?
    var statusId: Int?
    var createdDate: String?
    var updatedDate: String?
    var bankAccountNumber: JSONNull?
    var ifsc: JSONNull?
    var languageId: Int?
    var profilePictureName: JSONNull?
    var profilePictureExtention: JSONNull?
    var otp: JSONNull?
    var rowNumber: Int?
    var stateName: JSONNull?
    var amount: JSONNull?
    var campaignName: JSONNull?
    var scanUpdatedDate: JSONNull?
    var fcmToken: JSONNull?
    var approvedBy: JSONNull?
    var kycStatus: Int?
    var frontPan: JSONNull?
    var frontAadhar: JSONNull?
    var backAadhar:JSONNull?
    var gstDoc: JSONNull?
    var paramName: JSONNull?
    var paramValue: String?
    var existStatusID: Int?
    var retID: Int?
    var scanType: JSONNull?
    var isUserLoggedIn: Int?
    var myParentText: JSONNull?
    var campaignId: JSONNull?
    var reedemCode: JSONNull?
    var roleName: JSONNull?
    var strRoleId: JSONNull?
    var lstRoles: JSONNull?
    var lstCampaigns: JSONNull?
    var lstUsers: JSONNull?
    var approvedByFullName: JSONNull?

    
    enum CodingKeys: String, CodingKey {
        case objectChanged = "objectChanged"
        case id = "id"
        case userName = "userName"
        case password = "password"
        case alternateEmail = "alternateEmail"
        case phoneNumber = "phoneNumber"
        case companyName = "companyName"
        case dob = "dob"
        case anniversaryDate = "anniversaryDate"
        case city = "city"
        case cityName = "cityName"
        case state = "state"
        case pincode = "pincode"
        case address = "address"
        case gst = "gst"
        case pan = "pan"
        case aadharNumber = "aadharNumber"
        case aadharPhotoPath = "aadharPhotoPath"
        case panPhotoPath = "panPhotoPath"
        case profilePicture = "profilePicture"
        case approvedDate = "approvedDate"
        case roleID = "roleID"
        case parentId = "parentId"
        case deviceID = "deviceID"
        case isVerified = "isVerified"
        case verficationCode = "verficationCode"
        case verficationDate =  "verficationDate"
        case approvedByUserID =  "approvedByUserID"
        case statusId = "statusId"
        case createdDate = "createdDate"
        case updatedDate = "updatedDate"
        case bankAccountNumber = "bankAccountNumber"
        case ifsc = "ifsc"
        case languageId = "languageId"
        case profilePictureName = "profilePictureName"
        case profilePictureExtention = "profilePictureExtention"
        case otp = "otp"
        case rowNumber = "rowNumber"
        case stateName = "stateName"
        case amount = "amount"
        case campaignName = "campaignName"
        case scanUpdatedDate = "scanUpdatedDate"
        case fcmToken = "fcmToken"
        case approvedBy = "approvedBy"
        case kycStatus = "kycStatus"
        case frontPan = "frontPan"
        case frontAadhar = "frontAadhar"
        case backAadhar = "backAadhar"
        case gstDoc = "gstDoc"
        case paramName = "paramName"
        case paramValue = "paramValue"
        case existStatusID = "existStatusID"
        case retID = "retID"
        case scanType = "scanType"
        case isUserLoggedIn = "isUserLoggedIn"
        case myParentText = "myParentText"
        case campaignId = "campaignId"
        case reedemCode = "reedemCode"
        case roleName = "roleName"
        case strRoleId = "strRoleId"
        case lstRoles = "lstRoles"
        case lstCampaigns = "lstCampaigns"
        case lstUsers = "lstUsers"
        case approvedByFullName = "approvedByFullName"
        
    }

}



class GetUserTransaction: Codable {
    let getUserTransactionPostModels: GetUserTransactionPostModels?
    let getUserTransactionGetModels: GetUserTransactionGetModels?
    
    init(getUserTransactionPostModels: GetUserTransactionPostModels?, getUserTransactionGetModels: GetUserTransactionGetModels?) {
        self.getUserTransactionPostModels = getUserTransactionPostModels
        self.getUserTransactionGetModels = getUserTransactionGetModels
    }
}
//Post
struct GetUserTransactionPostModels: Codable {
    var id: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
    init(
        id: String?
    ){
        self.id = id
    }
}

//Get
class GetUserTransactionGetModels: Codable {
        let isSuccess: Bool?
        let messageCaption, message, jsonMessageType, returnURL: String?
        let flag: String?
        let data: [Values]?

    
    enum CodingKeys: String, CodingKey {
        case isSuccess, messageCaption, message, jsonMessageType
        case returnURL = "returnUrl"
        case flag
        case data = "data"
    }
}

// MARK: - data
class Values: Codable {
    var objectChanged: Bool?
    var id: Int?
    var scannedForUserID: Int?
    var scannedByUserID: Int?
    var scannedForMobileNo: JSONNull?
    var scannedByMobileNo: JSONNull?
    var scannedDate: String?
    var scannedCode: JSONNull?
    var amount: Int?
    var voucherQRCodeID: Int?
    var isPendingApproval: Int?
    var approvedByUserID: Int?
    var scanType: Int?
    var scanMessageReturned: Int?
    var statusId: Int?
    var createdDate: String?
    var updatedDate: String?
    var rowNumber: Int?
    var isRedeemed: Int?
    var isApprovalByAdmin: Bool?
    var campaignName: String?
    var pendingAmount: JSONNull?
    var redeemedAmount: JSONNull?
    var canceledAmount: JSONNull?

    enum CodingKeys: String, CodingKey {
        case objectChanged = "objectChanged"
        case id = "id"
        case scannedForUserID = "scannedForUserID"
        case scannedByUserID = "scannedByUserID"
        case scannedForMobileNo = "scannedForMobileNo"
        case scannedByMobileNo = "phoneNumber"
        case scannedDate = "scannedDate"
        case scannedCode = "scannedCode"
        case amount = "amount"
        case voucherQRCodeID = "voucherQRCodeID"
        case isPendingApproval = "isPendingApproval"
        case approvedByUserID = "approvedByUserID"
        case scanType = "scanType"
        case scanMessageReturned = "scanMessageReturned"
        case statusId = "statusId"
        case createdDate = "createdDate"
        case updatedDate = "updatedDate"
        case rowNumber = "rowNumber"
        case isRedeemed = "isRedeemed"
        case isApprovalByAdmin = "isApprovalByAdmin"
        case campaignName = "campaignName"
        case pendingAmount = "pendingAmount"
        case redeemedAmount = "redeemedAmount"
        case canceledAmount = "canceledAmount"
       
    }

}



