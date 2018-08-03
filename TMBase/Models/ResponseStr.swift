//
//  ResponseStr.swift
//  TMBase
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Response: BaseResponse, Mappable {
    public var data: String?
    public var status: String?
    public var error: String?
    
    public init() {
        
    }
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        data          <- map["data"]
        status        <- map["status"]
        error     <- map["error"]
    }
}
