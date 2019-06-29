//
//  GetRequest.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import UIKit

// Comment: Get Request Class to hit the GET API
class GetRequest: NSObject {
    static func getMethod(getURL: String, completion: @escaping requestCallBack) {
        Indicator.shared.showIndicator()
        let url = URL(string: getURL)
        var request = URLRequest(url: url!)
        let session = URLSession.shared
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            Indicator.shared.hideIndicator()
            if error != nil {
                DispatchQueue.main.async(execute: { () -> Void in
                    completion("nil", error?.localizedDescription)
                })
            } else {
                // try catch is used to handle error if there is any.
                do {
                    let json = try(JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves))
                    // Response is called back using Completion Handler
                    DispatchQueue.main.async(execute: { () -> Void in
                        Indicator.shared.hideIndicator()
                        completion(json, "nil")
                    })
                    
                } catch let err as NSError {
                    DispatchQueue.main.async(execute: { () -> Void in
                        Indicator.shared.hideIndicator()
                        completion("nil", err.localizedDescription)
                    })
                }
            }
        }
        task.resume()
    }
}
