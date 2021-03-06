//
//  CKRecordID.swift
//  OpenCloudKit
//
//  Created by Benjamin Johnson on 6/07/2016.
//
//

import Foundation

public class CKRecordID: NSObject  {
    
    public convenience init(recordName: String) {
        let defaultZone = CKRecordZoneID(zoneName: "_defaultZone", ownerName: "_defaultOwner")
        self.init(recordName: recordName, zoneID: defaultZone)
    }
    
    public init(recordName: String, zoneID: CKRecordZoneID) {
        
        self.recordName = recordName
        self.zoneID = zoneID
        
    }
    
    public let recordName: String
    
    public var zoneID: CKRecordZoneID
    
}

extension CKRecordID {
    
    convenience init?(recordDictionary: [String: Any]) {
        
        guard let recordName = recordDictionary[CKRecordDictionary.recordName] as? String,
            let zoneIDDictionary = recordDictionary[CKRecordDictionary.zoneID] as? [String: Any]
            else {
                return nil
        }
        
        // Parse ZoneID Dictionary into CKRecordZoneID
        let zoneID = CKRecordZoneID(dictionary: zoneIDDictionary)!
        self.init(recordName: recordName, zoneID: zoneID)
    }
    
}
