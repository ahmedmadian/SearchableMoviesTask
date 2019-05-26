//
//  FlickerApiClient.swift
//  SearchableMoviesTask
//
//  Created by Madian on 5/26/19.
//  Copyright © 2019 Madian. All rights reserved.
//

import Foundation
import Alamofire

class FlickerApiClient {
    
    let baseUrl: String
    let apiKey: String
    
    init(baseUrl: String, apiKey: String) {
        self.baseUrl = baseUrl
        self.apiKey = apiKey
    }
    
    //END Point
    public enum Endpoints: String {
        case photoSearch = "?method=flickr.photos.search"
    }
    
    
    fileprivate func url(for endPoint: Endpoints) -> String {
        return "\(baseUrl)\(endPoint.rawValue)"
    }
    
    
    func execute<parseClass:Codable>(url: String, method: HTTPMethod, parameters: [String : Any] = [:], completionHandler: @escaping (parseClass?, Error?) -> Void){
        
        Alamofire.request(url, method: method, parameters: parameters,headers: nil).responseData { (response) in
            
            switch response.result{
                
            case .success(let data):
                do {
                    let object = try JSONDecoder().decode(parseClass.self, from: data)
                    completionHandler(object, nil)
                }
                catch {
                    completionHandler(nil, nil)
                }
                
            case .failure(let error):
                completionHandler(nil, error)
            }
        }
    }
    
    public  func execute<parseClass:Codable>(endPoint:Endpoints, method:HTTPMethod , parameters:[String:Any] = [:], completionHandler: @escaping (parseClass?, Error?) -> Void ) {
        
        var generalParameters : [String: Any] = [
            FlickrParameterKeys.Format: FlickrParameterValues.ResponseFormat,
            FlickrParameterKeys.APIKey: FlickrParameterValues.APIKey,
            FlickrParameterKeys.NoJSONCallback: FlickrParameterValues.DisableJSONCallback
        ]
        
        generalParameters.merge(with: parameters)
        
        execute(url: url(for: endPoint), method: method, parameters: generalParameters) { (response, error) in
            completionHandler(response, error)
        }
    }
    
}


// Addding a singleton
extension FlickerApiClient {
    static var shared = FlickerApiClient(baseUrl: Flickr.BaseURL, apiKey: FlickrParameterValues.APIKey)
}
