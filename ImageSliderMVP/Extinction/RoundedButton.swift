import UIKit

@IBDesignable
class RoundedButton: UIButton {
    private var _showShadow:Bool = false
    private var _isCircle:Bool = false
    private var _isTopCornerRadius : Bool = false
    private var _isBottomCornerRadius : Bool = false
    private var _isLeftCornerRadius : Bool = false
    private var _isRightCornerRadius : Bool = false
    private var _shadowColor: UIColor = #colorLiteral(red: 0.7725490196, green: 0.7725490196, blue: 0.7725490196, alpha: 1)
    private var _shadowOpacity: Float = 0
    private var _shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0)
    private var _shadowRadius: CGFloat = 0.0
    private var shadowLayer: CAShapeLayer!
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
    @IBInspectable var showShadow:Bool = false {
          didSet {
              self._showShadow = showShadow
          }
      }
    @IBInspectable var isRightCornerRadius : Bool = false {
        didSet{
            self._isRightCornerRadius = isRightCornerRadius
        }
    }
    
    @IBInspectable var padding:CGFloat = 20 {
        didSet{
            titleEdgeInsets = UIEdgeInsets(top: 0,left: padding,bottom: 0,right: padding)
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
    
    @IBInspectable var borderWidth : CGFloat = 0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var shadowColor: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) {
        didSet{
            self._shadowColor = shadowColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet{
            self._shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0.0, height: 0.0) {
        didSet{
            self._shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet{
            self._shadowRadius = shadowRadius
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        setupBorder()
        setupCircleBtn()
         addShadow()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
        setupBorder()
        setupCircleBtn()
         addShadow()
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
    private func addShadow() {
        if _showShadow {
            layer.shadowColor = shadowColor.cgColor
            layer.shadowOpacity = shadowOpacity
            layer.shadowOffset = shadowOffset
            layer.shadowRadius = shadowRadius
            layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            layer.masksToBounds = true
            clipsToBounds = false
        }
    }
}
