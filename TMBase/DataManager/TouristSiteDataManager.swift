//
//  TouristSiteDataManager.swift
//  TMBase
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import AwesomeCache
import ObjectMapper
import Moya_ObjectMapper

public struct TouristSiteDataManager {
    public static func getTouristSiteList(page: Int, limit: Int) -> Observable<TouristSiteResult> {
        return Network.request(target: .touristSiteList(page: page, limit: limit)).mapObject(TouristSiteResult.self)
    }
}
