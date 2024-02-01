//
//  Service_Profile_API.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 02/08/23.
//

import Foundation
class GetUserData: Codable {
    let getUserDataModels: GetUserDatatModels?
    
    
    init(getUserDataModels: GetUserDatatModels?) {
        self.getUserDataModels = getUserDataModels
       
    }
}
struct GetUserDatatModels: Codable {
        let isSuccess: Bool?
        let messageCaption, message, jsonMessageType, returnURL: String?
        let flag: String?
        let data: Datum?

    
    enum CodingKeys: String, CodingKey {
        case isSuccess, messageCaption, message, jsonMessageType
        case returnURL = "returnUrl"
        case flag
        case data = "data"
    }
}
// MARK: - data
struct Datum: Codable {
    var objectChanged: Bool?
    var id: Int?
    var userName: String?
    var fullName: String?
    var password: JSONNull?
    var alternateEmail: JSONNull?
    var phoneNumber: String?
    var companyName: String?
    var dob: String?
    var anniversaryDate: String?
    var city: String?
    var cityName: String?
    var state: String?
    var pincode: Int?
    var address: String?
    var gst: String?
    var pan: String?
    var aadharNumber: String?
    var aadharPhotoPath: String?
    var panPhotoPath: String?
    var profilePicture: String?
    var approvedDate: String?
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
    var bankAccountNumber: String?
    var ifsc: String?
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
    var frontPan: String?
    var frontAadhar: String?
    var backAadhar:String?
    var gstDoc: String?
    var paramName: JSONNull?
    var paramValue: String?
    var existStatusID: Int?
    var retID: Int?
    var scanType: JSONNull?
    var isUserLoggedIn: Int?
    var myParentText: String?
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
        case fullName = "fullName"
    }

}
