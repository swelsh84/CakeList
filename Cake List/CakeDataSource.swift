//
//  CakeDataSource.swift
//  Cake List
//
//  Created by Stu on 01/10/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

import UIKit

class CakeDataSource: NSObject, UITableViewDataSource{
    
    var cakes = [Cake]()
    var dataChanged: (() -> Void)?
    
    func refresh(){
        
        let networkClient = NetworkClient()
        
        networkClient.download(downloadURL: "https://gist.githubusercontent.com/hart88/198f29ec5114a3ec3460/raw/8dd19a88f9b8d24c23d9960f3300d0c917a4f07c/cake.json") { downloadedCakes in
            //Set the returned cakes object to the cakes class property
            self.cakes = downloadedCakes
            self.dataChanged?()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cakes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Load the cake from the array for the relevant index path row.
        let cake = cakes[indexPath.row]
        
        //Take the next available cell and update it's details for the next cake to be shown.
        let cell:CakeCell = tableView.dequeueReusableCell(withIdentifier: "CakeCell", for: indexPath) as! CakeCell
        cell.titleLabel.text = cake.title
        cell.descriptionLabel.text = cake.desc
        
        cell.cakeImageView.image = nil
        cell.tag = indexPath.row
        
        //Download the image for the cell.
        //This is an area where I would most likely use a 3rd party framework to assist with image caching. Alamofire or SDWebImage would be frameworks I would look at to assist with this.
        let imageURL = URL(string: cake.image)
        let task = URLSession.shared.dataTask(with: imageURL!) { (data, response, error) in
            guard let data = data, error == nil else { return }

            //Update the Cell Image on the main thread.
            DispatchQueue.main.async() {
                if cell.tag == indexPath.row{
                    cell.cakeImageView.image = UIImage(data: data)
                }
            }
        }
        task.resume()
        
        return cell
    }
    
}
