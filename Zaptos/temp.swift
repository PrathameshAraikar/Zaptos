////
////  temp.swift
////  Zaptos
////
////  Created by Prathamesh Araikar on 07/06/22.
////
//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
//
//
////
//// To read values from URLs:
//
//
//
//import Foundation
//
//// MARK: - WelcomeElement
//struct WelcomeElement: Codable {
//    let imageurl: String
//    let price, title: String
//}
//
//typealias Welcome = [WelcomeElement]
//
//// MARK: - Helper functions for creating encoders and decoders
//
//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}
//
//// MARK: - URLSession response handlers
//
//extension URLSession {
//    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        return self.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                completionHandler(nil, response, error)
//                return
//            }
//            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
//        }
//    }
//
//    func welcomeTask(with url: URL, completionHandler: @escaping (Welcome?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        return self.codableTask(with: url, completionHandler: completionHandler)
//    }
//}
//
//
