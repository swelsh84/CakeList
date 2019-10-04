//
//  NetworkClient.swift
//  Cake List
//
//  Created by Stu on 01/10/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

//A class to handle our Network connections. This class handles the downloading of cake data, and would also hold any upload calls in the future.

import Foundation

class NetworkClient {
    
    var cakes = [Cake]()
    
    func download(downloadURL: String, completion: @escaping ([Cake]) -> ()) {
        
        //Check that the given URL string can be converted to a URL object.
        guard let url = URL(string: downloadURL) else {
            print("Not a valid URL")
            return
        }
        
        //Creates a URLRequest with our new URL object and then creates a URLSession using the default configuration.
        let urlRequest = URLRequest(url: url)
        let dataSession = URLSession(configuration: .default)
        
        
        //Start downloading the data
        let task = dataSession.dataTask(with: urlRequest) { (data, response, error) in
            //Create a JSONDecoder as the url requested is a link to a json file.
            let jsonDecoder = JSONDecoder()
            do{
                //Decode the recovered data to an array of Cakes
                let cakes = try jsonDecoder.decode([Cake].self, from: data!)
                //Return the downloaded Cakes array to the CakeDataSource
                completion(cakes)
            } catch {
                print(error)
            }
            
        }
        task.resume()
    }
    
}
