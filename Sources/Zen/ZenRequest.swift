//
//  ZenRequest.swift
//
//  Created by Karim Ebrahem on 4/7/20.
//

import Foundation
import Alamofire

public typealias Service<Response> = (_ completionHandler: @escaping (Result<Response, Error>) -> Void) -> Void

@propertyWrapper
public class ZenRequest<T> where T: Codable {
    
    private var url: URL
    private var path: String?
    private var method: HTTPMethod?
    private var headers: [String: Any]?
    private var parameters: RequestParameters?
    private var request: URLRequest?
    
    public var projectedValue: ZenRequest<T> { return self }
    
    public init(_ url: String) {
        self.url = URL(string: url)!
    }
    
    @discardableResult
    func set(method: HTTPMethod) -> Self {
        self.method = method
        return self
    }
    
    @discardableResult
    public func set(path: String) -> Self {
        self.path = path
        return self
    }
    
    @discardableResult
    public func set(headers: [String: Any]?) -> Self {
        self.headers = headers
        return self
    }
    
    @discardableResult
    public func set(parameters: RequestParameters?) -> Self {
        self.parameters = parameters
        return self
    }
    
    public func build() throws {
        do {
            var urlRequest = URLRequest(
                url: url.appendingPathComponent(path ?? ""),
                cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                timeoutInterval: 25
            )
            urlRequest.httpMethod = method?.rawValue
            headers?.forEach {
                urlRequest.addValue($0.value as! String, forHTTPHeaderField: $0.key)
            }
            if let params = parameters {
                urlRequest = try buildRequestParams(urlRequest, params: params)
            }
            self.request = urlRequest
        } catch {
            throw ZenError.RequestBuilderFailed
        }
    }
    
    fileprivate func buildRequestParams(_ urlRequest: URLRequest, params: RequestParameters) throws -> URLRequest {
        var urlRequest = urlRequest
        urlRequest = try params.encoder.encode(params.parameters, into: urlRequest)
        return urlRequest
    }
    
    public var wrappedValue: Service<T> {
        get {
            return { completion in
                guard let request = self.request else { return }
                
                AF.request(request)
                    .responseData { (response: AFDataResponse<Data>) in
                        
                        switch response.result {
                        case .success(let data):
                            do {
                                let responseData = try JSONDecoder().decode(T.self, from: data)
                                completion(.success(responseData))
                            } catch {
                                completion(.failure(ZenError.DecodingResponseFailed))
                            }
                        case .failure(let error):
                            completion(.failure(error))
                        }
                }
            }
        }
    }
    
}
