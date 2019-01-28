//
//  ViewController.swift
//  table-view
//
//  Created by jamelouis on 2019/1/28.
//  Copyright © 2019 jamelouis. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let label = item.viewWithTag(1000) as! UILabel
        label.text = String(indexPath.row)

        return item
    }
    
}

