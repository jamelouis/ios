//
//  ViewController.swift
//  EditBox-swift
//
//  Created by jamelouis on 2019/1/9.
//  Copyright © 2019 jamelouis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var textField: UITextField!
    var isIntersect = false
    var dist = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(self,
                                       selector: #selector(ViewController.handleKeyboardWillShowNotification(_:)),
                                       name: UIResponder.keyboardWillShowNotification,
                                       object: nil )
        notificationCenter.addObserver(self,
                                       selector: #selector(ViewController.handleKeyboardWillHideNotification(_:)),
                                       name: UIResponder.keyboardWillHideNotification,
                                       object: nil )
    }
    
    @objc
    func handleKeyboardWillShowNotification(_ notification: Notification) {
        print("handleKeyboardWillShowNotification")
        let userInfo = notification.userInfo!
        
        var keyboardScreenBeginFrame = CGRect()
        if let value = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue) {
            keyboardScreenBeginFrame = value.cgRectValue
            print(keyboardScreenBeginFrame)
        }
        
        var keyboardScreenEndFrame = CGRect()
        if let value = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue) {
            keyboardScreenEndFrame = value.cgRectValue
            print(keyboardScreenEndFrame)
        }
        
        let keyboardViewBeginFrame = view.convert(keyboardScreenBeginFrame, from: view.window)
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)
        
        if textField.frame.intersects(keyboardViewEndFrame) {
            let originDelta = keyboardViewEndFrame.origin.y - keyboardViewBeginFrame.origin.y;
            let toBottonDist = view.frame.height - textField.frame.origin.y - textField.frame.height - 10;
            print("OriginDelta: %f",originDelta)
            dist = (Double)(originDelta + toBottonDist);
            view.frame.origin.y += originDelta + toBottonDist;
            
            isIntersect = true
        }
    }
    
    @objc
    func handleKeyboardWillHideNotification(_ notification: Notification) {
        print("handleKeyboardWillHideNotification")
        
        if (isIntersect){
            view.frame.origin.y += (CGFloat)(-dist);
            isIntersect = false
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /**
     https://stackoverflow.com/questions/10671698/detect-focus-change-for-uitextfield
     */
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.textField = textField;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.textField = textField;
    }
}

