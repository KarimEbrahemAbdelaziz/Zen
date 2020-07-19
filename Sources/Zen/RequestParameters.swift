//
//  RequestParameters.swift
//  
//
//  Created by KarimEbrahem on 7/19/20.
//

import Foundation
import Alamofire

public enum RequestParameters {
    case body([String: String]?)
    case url([String: String]?)
    
    var parameters: [String: String]? {
        switch self {
        case .body(let parameters), .url(let parameters):
            return parameters
        }
    }
    
    var encoder: ParameterEncoder {
        switch self {
        case .body:
            return JSONParameterEncoder.default
        case .url:
            return URLEncodedFormParameterEncoder.default
        }
    }
}
