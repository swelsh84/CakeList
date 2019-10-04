//
//  NetworkClient.swift
//  Cake List
//
//  Created by Stu on 01/10/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

import Foundation

class NetworkClient {
    
    var cakes = [Cake]()
    
    func download(url: String, completion: @escaping ([Cake]) -> ()) {
        
        guard let url = URL(string: url) else {
            print("Not a valid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        let dataSession = URLSession(configuration: .default)
        
        let task = dataSession.dataTask(with: urlRequest) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            do{
                let cakes = try jsonDecoder.decode([Cake].self, from: data!)
                print(cakes.count)
                completion(cakes)
            } catch {
                print(error)
            }
            
        }
        task.resume()
    }
    
}
