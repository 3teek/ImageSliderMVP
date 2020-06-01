import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    private var paddingUIEdge:UIEdgeInsets?
    
    @IBInspectable var padding : CGFloat = 20.0 {
        didSet{
            self.paddingUIEdge = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
        }
    }
    
    @IBInspectable var placeholderColor : UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) {
        didSet{
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var cornerRadius : CGFloat = 0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupPlaceholder()
        setupBorder()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupPlaceholder()
        setupBorder()
    }
    
    private func setupPlaceholder(){
        if let placeholderText = placeholder{
            let place = NSAttributedString(string: placeholderText, attributes: [NSAttributedString.Key.foregroundColor:placeholderColor])
            attributedPlaceholder = place
        }
    }
    
    private func setupBorder(){
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: paddingUIEdge ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: paddingUIEdge ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: paddingUIEdge ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
}
