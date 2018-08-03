//
//  ResponseAry.swift
//  TMBase
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import ObjectMapper

public struct ResponseAry<Y: Mappable>: BaseResponse, Mappable {
    typealias T = [Y]?
    
    public var data: [Y]?
    public var status: String?
    public var error: String?
    
    public init() {
        
    }
    
    public init?(map: Map) {
        
    }
    
    mutating public func mapping(map: Map) {
        data      <- map["data"]
        status    <- map["status"]
        error     <- map["error"]
    }
}
