//
//  AlohaAPIClient.swift
//  aloha
//
//  Created by Jacqueline Minneman on 2/11/17.
//  Copyright © 2017 Michelle Staton. All rights reserved.
//

import Foundation

class Constants {
    //test coordinates = Brooklyn Bridge
    static let xcoordinate: Double = 40.7
    static let ycoordinate: Double = 73.9
    static let radius: Double = 100
}




class AlohaAPIClient {
    
    class func getAPIData(with completion: @escaping ([[String:String]])-> Void) {
        
        //let urlString: String = "https://requestb.in/1hl4rhx1?x=\(Constants.xcoordinate)&y=\(Constants.ycoordinate)&radius=\(Constants.radius)"
        
        let urlString: String = "https://alohagdi.herokuapp.com/"
        
        let url = URL(string: urlString)
        
        if let unwrappedURL = url {
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: unwrappedURL) { (data, response, error) in
                
                if let unwrappedData = data {
                    
                    do {
                        
                        let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [[String: String]]
                        
                        completion(responseJSON)
                        
                        print(responseJSON)
                        
                    } catch {
                        
                        print(error)
                    }
                }
                
            }
            
            task.resume()
        }
    }
    
}
