import UIKit

@IBDesignable
class HomeTabbar: UITabBar {
    
    private var _curveOne:CGFloat = 30.0
    private var _curveTwo:CGFloat = 35.0
    private var _height:CGFloat = 37.0
    private var shapeLayer: CALayer?
    private var _isTopCornerRadius : Bool = false
    private var _isBottomCornerRadius : Bool = false
    private var _isLeftCornerRadius : Bool = false
    private var _isRightCornerRadius : Bool = false
 
    @IBInspectable var Height: CGFloat = 37.0 {
        didSet{
            self._height = Height
        }
    }
    @IBInspectable var CurveOne: CGFloat = 30.0 {
        didSet{
            self._curveOne = CurveOne
        }
    }
    @IBInspectable var CurveTwo: CGFloat = 35.0 {
        didSet{
            self._curveTwo = CurveTwo
        }
    }
    
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
    
    @IBInspectable var cornerRadius:CGFloat = 20 {
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
    @IBInspectable  var backgroundcolor: UIColor = UIColor.white{
        didSet{
            self .backgroundColor = backgroundcolor
        }
    }
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
//        shapeLayer.strokeColor = UIColor.white.cgColor
//        shapeLayer.fillColor = UIColor.white.cgColor
        
        shapeLayer.shadowColor = UIColor.white.cgColor
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
       
        self.shapeLayer = shapeLayer
      

    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }
    
    func createPath() -> CGPath {
        let path = UIBezierPath()
        
        let centerWidth = self.frame.width / 2
        path.move(to: CGPoint(x: 0, y: 0)) // start top left
        path.addLine(to: CGPoint(x: (centerWidth - self._height * 2), y: 0)) // the beginning of the trough
        
        path.addCurve(to: CGPoint(x: centerWidth, y: self._height),controlPoint1: CGPoint(x: (centerWidth - self._curveOne), y: 0), controlPoint2: CGPoint(x: centerWidth - self._curveTwo, y: self._height))
        
        path.addCurve(to: CGPoint(x: (centerWidth + self._height * 2), y: 0),controlPoint1: CGPoint(x: centerWidth + self._curveTwo, y: self._height), controlPoint2: CGPoint(x: (centerWidth + self._curveOne), y: 0))
        
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupBorder()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupBorder()
    }
    override func sizeThatFits(_ size: CGSize) -> CGSize {
             var sizeThatFits = super.sizeThatFits(size)
             sizeThatFits.height = 38

             return sizeThatFits
         }
}
