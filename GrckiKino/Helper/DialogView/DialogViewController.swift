//
//  DialogViewController.swift
//  GrckiKino
//
//  Created by Lazar Stojkovic on 28.11.20..
//

import UIKit
import PopupDialog

private let kMaxTextViewHeight: CGFloat = 200.0

class DialogViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private weak var rightButton: UIButton!
    @IBOutlet private weak var leftButton: UIButton!
    @IBOutlet private weak var textViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var textField: UITextField!
    
    // MARK: - Properties
    
    var titleText: String?
    var textFieldText: String?
    var placeHolder: String?
    var messageText: String?
    var rightButtonTitle: String?
    var leftButtonTitle: String?
    var rightButtonHandler: (() -> Void)?
    var leftButtonHandler: (() -> Void)?
    var showLeftButton = false {
        didSet {
            guard isViewLoaded else { return }
            leftButton.isHidden = !showLeftButton
        }
    }
    var showTextField = false {
        didSet {
            guard isViewLoaded else { return }
            textField.isHidden = !showTextField
        }
    }
    
    private var textViewContentSizeObserver: NSKeyValueObservation?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftButton.isHidden = !showLeftButton
        textField.isHidden = !showTextField
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        containerView.layer.masksToBounds = false
        
        textField.placeholder = placeHolder
        textField.keyboardType = .default
        leftButton.layer.cornerRadius = 5
        rightButton.layer.cornerRadius = 5
        
        titleLabel.textColor = .white
        if let titleText = titleText {
            titleLabel.text = titleText
        } else {
            titleLabel.isHidden = true
        }
        
        textView.isEditable = false
        textView.backgroundColor = .clear
        textView.textColor = .black
        textView.text = messageText
        textView.textAlignment = .center
        textView.indicatorStyle = .white
        textViewContentSizeObserver
            = textView.observe(\.contentSize,
                               changeHandler: { [weak self] textView, _ in
                                let height = textView.contentSize.height
                                self?.textViewHeightConstraint.constant
                                    = height < kMaxTextViewHeight ? height : kMaxTextViewHeight
                                if height >= kMaxTextViewHeight {
                                    textView.flashScrollIndicators()
                                }
            })
        
        rightButton.setTitle(rightButtonTitle, for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonAction), for: .touchUpInside)
        
        leftButton.setTitle(leftButtonTitle, for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonAction), for: .touchUpInside)
        textField.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    deinit {
        textViewContentSizeObserver = nil
    }
    
    @objc private func rightButtonAction() {
        dismiss(animated: true, completion: rightButtonHandler)
    }
    
    @objc private func leftButtonAction() {
        dismiss(animated: true, completion: leftButtonHandler)
    }
    
    @objc private func editingChanged(_ sender: UITextField) {
        textFieldText = sender.text
    }
    
}

extension UIViewController {
    
    @discardableResult
    func showAlert(title: String? = nil,
                    message: String?,
                    buttonTitle: String? = "OK",
                    handler: (() -> Void)? = nil) -> PopupDialog? {
        
        if let dialogView = UIStoryboard(name: "DialogView", bundle: nil).instantiateInitialViewController()
            as? DialogViewController {
            dialogView.titleText = title
            dialogView.messageText = message
            dialogView.rightButtonTitle = buttonTitle
            dialogView.rightButtonHandler = handler
            dialogView.showLeftButton = false
            
            let popupDialog = PopupDialog(viewController: dialogView, tapGestureDismissal: false)
            
            // customize the container view appearance
            let containterView = PopupDialogContainerView.appearance()
            containterView.backgroundColor = .clear
            containterView.shadowEnabled = false
            containterView.cornerRadius = Float(8)
            
            // customize overlay appearance
            let overlayView = PopupDialogOverlayView.appearance()
            overlayView.blurEnabled = false
            overlayView.opacity = 0.7
            overlayView.color = .black
            
            present(popupDialog, animated: true, completion: nil)
            
            return popupDialog
        }
        return nil
    }
    
    @discardableResult
    func showAlert(title: String? = nil,
                    message: String?,
                    leftButtonTitle: String = "OK",
                    leftButtonHandler: (() -> Void)?,
                    rightButtonTitle: String,
                    rightButtonHandler: (() -> Void)?) -> PopupDialog? {
        
        if let dialogView = UIStoryboard(name: "DialogView", bundle: nil).instantiateInitialViewController()
            as? DialogViewController {
            dialogView.titleText = title
            dialogView.messageText = message
            dialogView.rightButtonHandler = rightButtonHandler
            dialogView.leftButtonHandler = leftButtonHandler
            dialogView.rightButtonTitle = rightButtonTitle
            dialogView.leftButtonTitle = leftButtonTitle
            dialogView.showLeftButton = true
            
            let popupDialog = PopupDialog(viewController: dialogView, tapGestureDismissal: false)
            
            // customize the container view appearance
            let containterView = PopupDialogContainerView.appearance()
            containterView.backgroundColor = .clear
            containterView.shadowEnabled = false
            containterView.cornerRadius = Float(8)
            
            // customize overlay appearance
            let overlayView = PopupDialogOverlayView.appearance()
            overlayView.blurEnabled = false
            overlayView.opacity = 0.7
            overlayView.color = .black
            
            present(popupDialog, animated: true, completion: nil)
            
            return popupDialog
        }
        return nil
    }
}
