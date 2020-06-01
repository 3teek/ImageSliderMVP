import UIKit

@IBDesignable
class InsetTextView: UITextView {
    
    private var paddingUIEdge:UIEdgeInsets?
    
    @IBInspectable var cornerRadius : CGFloat = 20.0{
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
    
    @IBInspectable var padding : CGFloat = 20.0 {
        didSet{
            self.paddingUIEdge = UIEdgeInsets(top: padding, left: padding, bottom: padding , right: padding)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    private func setupView() {
        self.textContainerInset = paddingUIEdge ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
    }
}
