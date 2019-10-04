//
//  TestController.swift
//  Cake List
//
//  Created by Stu on 01/10/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UITableViewController {
    
    let dataSource = CakeDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.dataChanged = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }            
        }
        
        dataSource.refresh()
        tableView.dataSource = dataSource
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
