//
//  CustomTextField.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 29.11.20..
//

import UIKit

class CustomTextField: UITextField {
    
    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }

    // MARK: - Setup Methods
    
    private func setup() {
        font = FontFamily.Montserrat.regular.font(size: 16)
        textColor = .white
        backgroundColor = .clear
        
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.font: FontFamily.Montserrat.regular.font(size: 16)!
        ]
        
        attributedPlaceholder = NSAttributedString(string: placeholder ?? "" ,attributes: attributes)
    }
}
