//
//  TestController.swift
//  Cake List
//
//  Created by Stu on 01/10/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

//I have changed the main view controller to this one, so as to keep as much of the project in Swift as possible.

//While working on this solution, I noticed that the links to Carrot cake and Birthday cake are now dead. If this was an issue that I was supposed to solve I can only apologise for omitting it as I couldn't see a way to solve an issue with the initial json file.

import Foundation
import UIKit

class MainViewController: UITableViewController {
    
    //The main data source object for the UITableView
    let dataSource = CakeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Monitor for changes in the TableView Delegates data, and refresh the table view when this is detected.
        dataSource.dataChanged = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }            
        }
        
        //Sets the dataSource object to start downloading Cake data and then attaches this dataSource to the one for the TableView. The tableview is then reloaded.
        dataSource.refresh()
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    //Set the height of the TableView Cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
