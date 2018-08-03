//
//  BaseResponse.swift
//  TMBase
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

protocol BaseResponse {
    associatedtype T
    var status: String? {get set}
    var data: T {get set}
    var error: String? {get set}
}
