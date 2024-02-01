//
//  service_Api.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 28/07/23.
//

import Foundation


//Get
struct BrochuresDataGetModels: Codable {
        let isSuccess: Bool?
        let messageCaption, message, jsonMessageType, returnURL: String?
        let flag: String?
        let data: [Data1]?

    
    enum CodingKeys: String, CodingKey {
        case isSuccess, messageCaption, message, jsonMessageType
        case returnURL = "returnUrl"
        case flag
        case data = "data"
    }
   
}

// MARK: - data
struct Data1: Codable {
    
        var objectChanged: Bool?
        var id: Int?
        var createdByUserID: Int?
        var fileName: String?
        var documentType: Int?
        var documentPath: String?
        var statusId: Int?
        var createdDate: String?
        var updatedDate: String?
        var category: JSONNull?
        var selectedId: Int?

    
    
    enum CodingKeys: String, CodingKey {
        case objectChanged = "objectChanged"
        case id = "ID"
        case createdByUserID = "createdByUserID"
        case fileName = "fileName"
        case documentType = "documentType"
        case documentPath = "documentPath"
        case statusId = "statusId"
        case createdDate = "createdDate"
        case updatedDate = "updatedDate"
        case category = "category"
        case selectedId = "selectedId"
        
    }
  
}




