//
//  ViewController.swift
//  table-view
//
//  Created by jamelouis on 2019/1/28.
//  Copyright © 2019 jamelouis. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, ItemDetailViewControllerDelegate {

    var itemList: ItemList
    
    required init?(coder aDecoder: NSCoder) {
        itemList = ItemList()
        itemList.items.append("1")
        itemList.items.append("2")
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let label = item.viewWithTag(1000) as! UILabel
        label.text = itemList.items[indexPath.row]

        return item
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        itemList.items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Add Item" {
            let navigation = segue.destination as! UINavigationController
            let controller = navigation.topViewController as! ItemDetailViewController
            controller.delegate = self
        }else if segue.identifier == "Edit Item" {
            let navigation = segue.destination as! UINavigationController
            let controller = navigation.topViewController as! ItemDetailViewController
            controller.delegate = self
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.content = itemList.items[indexPath.row]
            }
        }
    }
    
    func AddItem(cellContent: String) {
        print(cellContent)
        itemList.items.append(cellContent)
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    func CancelAddItem() {
        dismiss(animated: true, completion: nil)
    }
    
    func EditItem(_ controller: ItemDetailViewController, didFinishEditing cellContent: String, withContent content: String) {
        if let index = itemList.items.index(of: cellContent) {
            itemList.items[index] = content
            tableView.reloadData()
        }

        dismiss(animated: true, completion: nil)
    }
}

