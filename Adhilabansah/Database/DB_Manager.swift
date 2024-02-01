//
//  DB_Manager.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 14/08/23.
//

import Foundation
import SQLite3

class DB_Manager
{
    let dbPath: String = "myDb.sqlite"
    var db:OpaquePointer?
    init()
    {
        db = openDatabase()
        createTable()
       
    }
    
    func openDatabase() -> OpaquePointer?
    {
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        print(fileURL)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    func createTable() {
        let createTableString = "CREATE TABLE IF NOT EXISTS UserData(Id INTEGER PRIMARY KEY, FullName TEXT , PhoneNumber TEXT , CompanyName TEXT, CityName TEXT, State TEXT, Address TEXT, Gst TEXT, Pan TEXT);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("UserData table created.")
            } else {
                print("UserData table could not be created.")
            }
        } else {
            print("CREATE TABLE UserData statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    //Profile screen data
    func insertUserData(userData : GetUserDatatModels)
    {
        let insertStatementString = "INSERT INTO UserData (Id, FullName , PhoneNumber , CompanyName , CityName , State , Address, Gst, Pan) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(insertStatement, 1, Int32((userData.data?.id)!))
            sqlite3_bind_text(insertStatement, 2, ((userData.data?.fullName)! as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, ((userData.data?.phoneNumber)!as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, ((userData.data?.companyName)! as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, ((userData.data?.cityName)!  as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, ((userData.data?.state)! as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 7, ((userData.data?.address)! as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 8, ((userData.data?.gst)! as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 9, ((userData.data?.pan)! as NSString).utf8String, -1, nil)

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT GetUserDatatModels statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    //Register screen data
    func insertRegUserData(fullName : String , phoneNumber : String , companyName : String, cityName: String, state: String, address: String, gst: String, pan: String)
    {
        let insertStatementString = "INSERT INTO UserData (Id, FullName , PhoneNumber , CompanyName , CityName , State , Address, Gst, Pan) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 2, ((fullName) as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 3, ((phoneNumber)as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 4, ((companyName) as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 5, ((cityName)  as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 6, ((state) as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 7, ((address) as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 8, ((gst) as NSString).utf8String, -1, nil)
            sqlite3_bind_text(insertStatement, 9, ((pan) as NSString).utf8String, -1, nil)

            if sqlite3_step(insertStatement) == SQLITE_DONE {
                print("Successfully inserted row.")
                
            } else {
                print("Could not insert row.")
            }
        } else {
            print("INSERT GetUserDatatModels statement could not be prepared.")
        }
        sqlite3_finalize(insertStatement)
    }
    
    func readUserData () -> [Datum]{
        let queryStatementString = "SELECT * FROM UserData;"
        
        var queryStatement: OpaquePointer? = nil
        var userData : [Datum] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW{
                let id = sqlite3_column_int(queryStatement, 0)
                let fullName = String(describing: String(cString: sqlite3_column_text(queryStatement, 1)))
                let phoneNumber = String(describing: String(cString: sqlite3_column_text(queryStatement, 2)))
                let companyName = String(describing: String(cString: sqlite3_column_text(queryStatement, 3)))
                let cityName = String(describing: String(cString: sqlite3_column_text(queryStatement, 4)))
                let state = String(describing: String(cString: sqlite3_column_text(queryStatement, 5)))
                let address = String(describing: String(cString: sqlite3_column_text(queryStatement, 6)))
                let gst = String(describing: String(cString: sqlite3_column_text(queryStatement, 7)))
                let pan = String(describing: String(cString: sqlite3_column_text(queryStatement, 8)))
              
                userData.append (Datum(id: Int(id), fullName: fullName, phoneNumber: phoneNumber, companyName: companyName, cityName: cityName, state: state, address: address, gst: gst, pan: pan))

                print("\(id) | \(fullName) | \(phoneNumber) | \(companyName) | \(cityName) | \(state) | \(address) | \(gst) | \(pan) ")
              
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return userData
    }
    
    func updateUserData( fullName : String , phoneNumber : String , companyName : String, cityName: String, state: String, address: String, gst: String, pan: String)
    {
        print("working")
        let updateStatementString = "UPDATE UserData SET FullName = '\(fullName)' , PhoneNumber = '\(phoneNumber)' , CompanyName = '\(companyName)', CityName = '\(cityName)', State = '\(state)', Address = '\(address)', Gst = '\(gst)', Pan = '\(pan)' ;"
        print("\(fullName) | \(phoneNumber) | \(companyName)")
        
        var updateStatement: OpaquePointer?
        if sqlite3_prepare_v2(db, updateStatementString, -1, &updateStatement, nil) ==
            SQLITE_OK {
            if sqlite3_step(updateStatement) == SQLITE_DONE {
                print("\nSuccessfully updated row.")
            } else {
                print("\nCould not update row.")
            }
        } else {
            print("\nUPDATE statement is not prepared")
        }
        sqlite3_finalize(updateStatement)
        
    }
    
    func deleteUserDataByID(id:Int) {
        let deleteStatementStirng = "DELETE FROM UserData WHERE Id = '\(id)';"
        var deleteStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, deleteStatementStirng, -1, &deleteStatement, nil) == SQLITE_OK {
            sqlite3_bind_int(deleteStatement, 1, Int32(id))
            if sqlite3_step(deleteStatement) == SQLITE_DONE {
                print("Successfully deleted row.")
            } else {
                print("Could not delete row.")
            }
        } else {
            print("DELETE statement could not be prepared")
        }
        sqlite3_finalize(deleteStatement)
    }
    
    func checkID(){
        let checkStatementStirng = "Select ID FROM UserData';"
    }
}
