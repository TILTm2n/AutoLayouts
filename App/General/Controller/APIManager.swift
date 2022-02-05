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
    
    func URLSessionDataTask(request: URLRequest, completionHandler: ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void) -> JSONTask
    func fetch<T>(request: URLRequest, parse: ([String: AnyObject]) -> T?, completionHandler: (APIResult<T>) -> Void)
}
