//
//  ChakaApiClient.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 30/05/2021.
//
import Foundation
import Alamofire

class ChakaApiClient {
    enum HttpMethodType: String {
        case get, post, patch, delete, put
    }

    func execute <DataModel: Decodable> (requestType: HttpMethodType = .get, url: String, params: [String: String] = [:], success: @escaping (DataModel) -> (), failure: @escaping (String) -> ()) {
        let convertedHttpMethod = httpMethodConversion(httpMethod: requestType)
        AF.request(url, method: convertedHttpMethod, parameters: params).responseDecodable(of: DataModel.self) { response in
                if let error = response.error {
                    failure(error.localizedDescription)
                    return
                }
                if let result = response.value {
                    success(result)
                    return
                }
        }
    }
    
    // This function converts httpMethodType enum (business logic) to Alamofire httpmethod
    private func httpMethodConversion(httpMethod: HttpMethodType) -> HTTPMethod {
        let requestTypeRawValue = httpMethod.rawValue
        let convertedHttpMethod = HTTPMethod(rawValue: requestTypeRawValue)
        return convertedHttpMethod
    }
}
