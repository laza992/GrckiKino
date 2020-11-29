//
//  UITextField.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 29.11.20..
//

import UIKit

extension UITextField {
    
    func setInputViewPicker(target: Any, selector: Selector, inputView: UIView) {
        let screenWidth = UIScreen.main.bounds.width
        self.inputView = inputView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0))
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel))
        cancel.tintColor = ColorName.themeBlue.color
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector)
        barButton.tintColor = ColorName.themeBlue.color
        toolBar.setItems([cancel, flexible, barButton], animated: false)
        
        self.inputAccessoryView = toolBar
    }
    
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
}
