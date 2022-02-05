//
//  APIManager.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 05.02.2022.
//

import Foundation

//typealias JSONTask = URLSessionDataTask
//typealias JSONCompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void

enum APIResult<T> {
    case Success(T)
    case Failure(Error)
}

protocol APIManager {
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTaskWith(request: URLRequest, completionHandler: ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void) -> URLSessionDataTask
    func fetch<T>(request: URLRequest, parse: ([String: AnyObject]) -> T?, completionHandler: (APIResult<T>) -> Void)
    
    init(sessionConfiguration: URLSessionConfiguration)
}

//дефолтная реализация
extension APIManager {
    func JSONTaskWith(request: URLRequest, completionHandler: @escaping ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void) -> URLSessionDataTask{
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            guard let HTTPResponse = response as? HTTPURLResponse else {
                
                let userInfo = [NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "")]
                let error = NSError(domain: NetworkingErrorDomain, code: MissingHTTPResponseError, userInfo: userInfo)
                
                completionHandler(nil, nil, error)
                return
            }
            
            if data == nil{
                if let error = error{
                    completionHandler(nil, HTTPResponse, error)
                }
            }else{
                switch HTTPResponse.statusCode{
                case 200:
                    do{
                        let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                        completionHandler(json, HTTPResponse, nil)
                    }catch let error as NSError{
                        completionHandler(nil, HTTPResponse, error)
                    }
                default:
                    print("We have got response status \(HTTPResponse.statusCode)")
                }
            }
        }
        return dataTask
    }
}
