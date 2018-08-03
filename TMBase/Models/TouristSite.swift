//
//  TouristSite.swift
//  TMBase
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import ObjectMapper

public struct TouristSite: Mappable {
    public var id: String?
    public var rowNumber: String?
    public var rEF_WP: String?
    public var cAT1: String?
    public var cAT2: String?
    public var sERIAL_NO: String?
    public var mEMO_TIME: String?
    public var stitle: String?
    public var xbody: String?
    public var avBegin: String?
    public var avEnd: String?
    public var idpt: String?
    public var address: String?
    public var xpostDate: String?
    public var file: String?
    public var langinfo: String?
    public var pOI: String?
    public var info: String?
    public var longitude: String?
    public var latitude: String?
    public var mRT: String?
    
    public init() {
        
    }
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        id          <- map["_id"]
        rowNumber   <- map["RowNumber"]
        rEF_WP      <- map["REF_WP"]
        cAT1        <- map["CAT1"]
        cAT1        <- map["CAT1"]
        sERIAL_NO   <- map["SERIAL_NO"]
        stitle      <- map["stitle"]
        xbody       <- map["xbody"]
        avBegin     <- map["avBegin"]
        avEnd       <- map["avEnd"]
        idpt        <- map["idpt"]
        address     <- map["address"]
        xpostDate   <- map["xpostDate"]
        file        <- map["file"]
        langinfo    <- map["langinfo"]
        pOI         <- map["POI"]
        info        <- map["info"]
        longitude   <- map["longitude"]
        latitude    <- map["latitude"]
        mRT         <- map["MRT"]
    }
}

extension TouristSite : Equatable {
    
    static public func ==(lhs: TouristSite, rhs: TouristSite) -> Bool {
        return lhs.id == rhs.id
    }
    
}
