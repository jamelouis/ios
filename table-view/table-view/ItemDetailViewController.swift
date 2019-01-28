//
//  ItemDetailViewController.swift
//  table-view
//
//  Created by jamelouis on 2019/1/28.
//  Copyright © 2019 jamelouis. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate : class {
    func AddItem(cellContent: String)
    func CancelAddItem()
    func EditItem(_ controller: ItemDetailViewController, didFinishEditing cellContent: String, withContent content: String)
}

class ItemDetailViewController: UITableViewController {
    
    weak var delegate: ItemDetailViewControllerDelegate?
    
    @IBOutlet weak var textField: UITextField!
    
    var content: String?
    
    override func viewWillAppear(_ animated: Bool) {
        if let text = content {
            title = "Edit Item"
            textField.text = text
        }
        
        textField.becomeFirstResponder()
    }
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if let c = content {
            delegate?.EditItem(self, didFinishEditing: c, withContent: textField.text!)
        } else  {
            if let text = textField.text {
                delegate?.AddItem(cellContent: text)
            }
        }
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.CancelAddItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
