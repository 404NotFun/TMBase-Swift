//
//  TtsApi.swift
//  TMBase
//
//  Created by Jason Tsai on 2018/7/27.
//  Copyright © 2018年 TMAker. All rights reserved.
//

import Foundation
import Moya

enum TtsApi {
    case touristSiteList(page: Int, limit: Int)
}

extension TtsApi: TargetType {
    var method: Moya.Method {
        switch self {
            case .touristSiteList:
                return .get
            default:
                return .get
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
            case.touristSiteList(page: let page, limit: let limit):
                return [ "offset": (page-1)*limit, "limit": limit ]
            default:
                return nil
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return method == .get ? URLEncoding.default : JSONEncoding.default
    }
    
    var sampleData: Data {
        switch self {
            default:
                return Data()
        }
    }
    
    var task: Task {
        return .request
    }
    

    var baseURL: URL {
        return URL(string: "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=36847f3f-deff-4183-a5bb-800737591de5")!
    }
    
    var path: String {
        switch self {
            case.touristSiteList(page: let page, limit: let limit):
                return ""
        }
    }
        
    var token: String? {
        return ""
    }
    
    var headers: [String: String]? {
        switch self {
        default:
            guard let token = token else {
                return ["Accept": "application/json"]
            }
            return ["Authorization": "bearer \(token)", "Accept": "application/json"]
        }
    }
    
    var validate: Bool {
        switch self {
        case .touristSiteList:
            return true
        default:
            return true
        }
    }
    
    func stubbedResponse(_ filename: String) -> Data! {
        @objc class TestClass: NSObject { }
        let bundle = Bundle(for: TestClass.self)
        let path = bundle.path(forResource: filename, ofType: "json")
        return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
    }
    
    var udid: String {
        return (UIDevice.current.identifierForVendor?.uuidString)!
    }
    
    var client: String {
        return UIDevice.current.name
    }
    
    var bundleVersion: String {
        if let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String {
            return version
        }
        return ""
    }
}

