//
//  GET.swift
//
//  Created by Karim Ebrahem on 4/7/20.
//

import Foundation
import Alamofire

public typealias Service<Response> = (_ completionHandler: @escaping (Result<Response, Error>) -> Void) -> Void

@propertyWrapper
public struct GET<T> where T: Codable {
    
    private var url: URL
    
    public init(url: String) {
        self.url = URL(string: url)!
    }
    
    public var wrappedValue: Service<T> {
        get {
            return { completion in
                AF.request(self.url, method: .get, parameters: nil, headers: nil, interceptor: nil).responseData { (response: AFDataResponse<Data>) in
                    
                    switch response.result {
                    case .success(let data):
                        let responseData = try! JSONDecoder().decode(T.self, from: data)
                        completion(.success(responseData))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                    
                }
            }
        }
    }
    
}
