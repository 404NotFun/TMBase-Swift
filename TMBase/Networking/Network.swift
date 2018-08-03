//
//  Network.swift
//  TMBase
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import Moya
import RxSwift

let endpointClosure = { (target: TtsApi) -> Endpoint<TtsApi> in
    let url = target.baseURL.appendingPathComponent(target.path).absoluteString
    return Endpoint(url: url,
                    sampleResponseClosure: {.networkResponse(200, target.sampleData)},
                    method: target.method,
                    parameters: target.parameters,
                    parameterEncoding: target.parameterEncoding,
                    httpHeaderFields: target.headers)
}

public struct Network {
    fileprivate static var provider = RxMoyaProvider<TtsApi>(
        endpointClosure: endpointClosure,
        plugins: [NetworkLoggerPlugin(verbose: true)])
}

extension Network {
    static func request(target: TtsApi) -> Observable<NSString> {
        return provider.request(target)
            .flatMap({ (response) -> Observable<NSString> in
                let string = String(data:response.data, encoding: .utf8)
                return Observable.just(string! as NSString)
            })
    }
}
