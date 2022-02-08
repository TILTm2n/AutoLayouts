//
//  APIManager.swift
//  AutoLayoutsApp
//
//  Created by Eugene on 05.02.2022.
//

import Foundation

//typealias JSONTask = URLSessionDataTask
//typealias JSONCompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void

protocol JSONDecodable {
    init?(JSON: [String: AnyObject])
}

protocol FinalURLPoint {
    var baseURL: URL { get }
    var path: String { get }
    var request: URLRequest { get }
}

enum APIResult<T> {
    case Success(T)
    case Failure(Error)
}

protocol APIManager {
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    //получает данные
    func JSONTaskWith(request: URLRequest, completionHandler: @escaping ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void) -> URLSessionDataTask
    
    //использует данные для обновленя интерфейса
    func fetch<T: JSONDecodable>(request: URLRequest, parse: ([String: AnyObject]) -> T?, completionHandler: @escaping (APIResult<T>) -> Void)
    
    //init(sessionConfiguration: URLSessionConfiguration)
}

//дефолтная реализация
extension APIManager {
    func JSONTaskWith(request: URLRequest, completionHandler: @escaping ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void) -> URLSessionDataTask{
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            
            //проверяем наличие HTTPURLResponse
            guard let HTTPResponse = response as? HTTPURLResponse else {
                
                let userInfo = [NSLocalizedDescriptionKey: NSLocalizedString("Missing HTTP Response", comment: "")]
                let error = NSError(domain: NetworkingErrorDomain, code: MissingHTTPResponseError, userInfo: userInfo)
                
                //если нет, то возвращаем в completionHandler данные
                completionHandler(nil, nil, error)
                return
            }
            
            //проверяем пустые ли данные
            if data == nil{
                if let error = error{
                    
                    //если да и есть ошибка, то возвращаем в completionHandler данные
                    completionHandler(nil, HTTPResponse, error)
                }
            }else{
                switch HTTPResponse.statusCode{
                case 200:
                    do{
                        //сериализуем данные из json формата в объект Foundation
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
    
    func fetch<T>(request: URLRequest, parse: @escaping ([String: AnyObject]) -> T?, completionHandler: @escaping (APIResult<T>) -> Void){
        
        let dataTask = JSONTaskWith(request: request) { json, response, error in
            guard let json = json else{
                if let error = error {
                    completionHandler(.Failure(error))
                }
                return
            }
            
            if let value = parse(json) {
                completionHandler(.Success(value))
            } else {
                let error = NSError(domain: NetworkingErrorDomain, code: 200, userInfo: nil)
                completionHandler(.Failure(error))
            }
        }
        
        dataTask.resume()
    }
}
