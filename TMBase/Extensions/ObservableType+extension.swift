//
//  ObservableType+extension.swift
//  TMBase
//
//  Created by Jason Tsai on 2018/8/3.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import AwesomeCache
import ObjectMapper
import Moya_ObjectMapper

extension ObservableType where E == NSString {
    
    public func mapObject<T: BaseMappable>(_ type: T.Type) -> Observable<T> {
        return self.flatMap { (string) -> Observable<T> in
            let data = Mapper<T>().map(JSONString: string as String)
            return Observable.just(data!)
        }
    }
    
    public func takeCacheOrNet() -> Observable<NSString> {
        return self
            .filter({ (string) -> Bool in
                return !string.isEqual(to: "")
            })
            .take(1)
    }
    
    public func writeCache(key: String) -> Observable<NSString> {
        return self
            .flatMap { data -> Observable<NSString> in
                return CacheManager.writeDataToDisk(key: key, data: data)
            }
            .flatMap { data -> Observable<NSString> in
                return CacheManager.writeDataToWeeklyDisk(key: key, data: data)
            }
            .catchError({ (_) -> Observable<NSString> in
                return CacheManager.readDataFromWeeklyCache(key: key)
            })
    }
}
