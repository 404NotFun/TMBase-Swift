//
//  TouristSiteResult.swift
//  TMBase
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import ObjectMapper

public struct TouristSiteResult: Mappable {
    public var offset: Int = 0
    public var limit: Int = 0
    public var count: Int = 0
    public var sort: String?
    public var results = [TouristSite]()
    
    public init() {
        
    }
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        offset  <- map["result.offset"]
        limit   <- map["result.limit"]
        count   <- map["result.count"]
        sort    <- map["result.sort"]
        results <- map["result.results"]
    }
}
