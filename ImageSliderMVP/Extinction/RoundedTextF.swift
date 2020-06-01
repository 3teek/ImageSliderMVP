//
//  RoundedTextF.swift
//  Camel
//
//  Created by iSlahul on 14/03/1441 AH.
//  Copyright © 1441 Ateek. All rights reserved.
//
import UIKit

@IBDesignable
class RoundedTextFields: UITextField {
    
    private var _isCircle:Bool = false
    private var _isTopCornerRadius : Bool = false
    private var _isBottomCornerRadius : Bool = false
    private var _isLeftCornerRadius : Bool = false
    private var _isRightCornerRadius : Bool = false
    var padding = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    @IBInspectable var isTopCornerRadius : Bool = false {
        didSet{
            self._isTopCornerRadius = isTopCornerRadius
        }
    }
    
    @IBInspectable var isBottomCornerRadius : Bool = false {
        didSet{
            self._isBottomCornerRadius = isBottomCornerRadius
        }
    }
    
    @IBInspectable var isLeftCornerRadius : Bool = false {
        didSet{
            self._isLeftCornerRadius = isLeftCornerRadius
        }
    }
    
    @IBInspectable var isRightCornerRadius : Bool = false {
        didSet{
            self._isRightCornerRadius = isRightCornerRadius
        }
    }
    
    
    @IBInspectable var cornerRadius:CGFloat = 20{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var isCircle:Bool = false {
        didSet {
            self._isCircle = isCircle
        }
    }
    
    @IBInspectable var borderColor : UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) {
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable  var leftPading:CGFloat = 0{
        didSet {
            self.padding = UIEdgeInsets(top: topPading, left: leftPading, bottom: bottomPading, right: rightPading)
        }
    }
    @IBInspectable  var rightPading:CGFloat = 0{
        didSet {
            self.padding = UIEdgeInsets(top: topPading, left: leftPading, bottom: bottomPading, right: rightPading)
        }
    }
    @IBInspectable var topPading:CGFloat = 0 {
        didSet {
            self.padding = UIEdgeInsets(top: topPading, left: leftPading, bottom: bottomPading, right: rightPading)
        }
    }
    @IBInspectable var bottomPading:CGFloat = 0 {
        didSet {
            self.padding = UIEdgeInsets(top: topPading, left: leftPading, bottom: bottomPading, right: rightPading)
        }
    }
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupView()
        setupBorder()
        setupCircleBtn()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
        setupBorder()
        setupCircleBtn()
    }
    
    private func setupView(){
        self.layer.cornerRadius = cornerRadius
    }
    
    private func setupCircleBtn(){
        if _isCircle {
            self.layer.cornerRadius = self.frame.height / 2
            self.clipsToBounds = true
        }else {
            setupView()
        }
    }
    
    private func setupBorder(){
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        if _isTopCornerRadius {
            self.layer.masksToBounds = true
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
        if _isBottomCornerRadius {
            self.layer.masksToBounds = true
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        }
        if _isLeftCornerRadius {
            self.layer.masksToBounds = true
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        }
        if _isRightCornerRadius {
            self.layer.masksToBounds = true
            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
    }
    
    
    
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
