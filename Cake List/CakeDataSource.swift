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
        
        networkClient.download(url: "https://gist.githubusercontent.com/hart88/198f29ec5114a3ec3460/raw/8dd19a88f9b8d24c23d9960f3300d0c917a4f07c/cake.json") { downloadedCakes in
            self.cakes = downloadedCakes
            self.dataChanged?()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cakes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cake = cakes[indexPath.row]
        
        let cell:CakeCell = tableView.dequeueReusableCell(withIdentifier: "CakeCell", for: indexPath) as! CakeCell
        print(cake.title)
        cell.titleLabel.text = cake.title
        cell.descriptionLabel.text = cake.desc
        
        cell.cakeImageView.image = nil
        cell.tag = indexPath.row
        
        let imageURL = URL(string: cake.image)
        let task = URLSession.shared.dataTask(with: imageURL!) { (data, response, error) in
            guard let data = data, error == nil else { return }

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
