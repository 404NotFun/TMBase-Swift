//
//  LogLevel.swift
//  TMBase
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation

public enum LogLevel: Int {
    
    case None = 0
    case Info = 1
    case Warning = 2
    case Error = 3
    case Http = 4
    
    var name: String {
        switch self {
        case .None:
            return "None"
        case .Info:
            return "Info"
        case .Warning:
            return "Warning"
        case .Error:
            return "Error"
        case .Http:
            return "HTTP"
        }
    }
    
}
