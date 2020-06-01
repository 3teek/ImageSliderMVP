import Foundation
import UIKit

@IBDesignable
class DashedLine: UIView {
    
    private var _dashColor: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    private var _lineWidth: CGFloat = 1.0
    private var _lineDashPatternX :Int = 9
    private var _lineDashPatternY :Int = 6
    
    @IBInspectable var dashColor : UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) {
        didSet{
            self._dashColor = dashColor
        }
    }
    
    @IBInspectable var lineWidth : CGFloat = 1.0 {
        didSet{
            self._lineWidth = lineWidth
        }
    }
    
    @IBInspectable var lineDashPatternX : Int = 9 {
        didSet{
            self._lineDashPatternX = lineDashPatternX
        }
    }
    
    @IBInspectable var lineDashPatternY : Int = 6 {
        didSet{
            self._lineDashPatternY = lineDashPatternY
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        let color = _dashColor.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: 0)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [_lineDashPatternX,_lineDashPatternY] as [NSNumber]
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: shapeRect.height, width: shapeRect.width, height: 0), cornerRadius: 0).cgPath
        self.layer.addSublayer(shapeLayer)
    }
    
}
