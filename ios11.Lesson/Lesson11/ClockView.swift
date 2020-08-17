import UIKit

@IBDesignable
class ClockView: UIView {
    var isSetuped = false
    
    @IBInspectable var markerSize: CGFloat = 3
    @IBInspectable var markerLength: CGFloat = 12
    @IBInspectable var markerColor: UIColor = UIColor.blue
    
    @IBInspectable var hourLineOffset: CGFloat = 30
    @IBInspectable var hourLineSize: CGFloat = 6
    @IBInspectable var hourLineColor: UIColor = UIColor.green
    
    @IBInspectable var hours: CGFloat = 7{
        didSet { updateHours() }
    }
    
    @IBInspectable var roundedViewColor = UIColor.yellow
    
    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()
    
    private let hourLine = UIView()
    
    private let roundedView = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let w = frame.size.width
        let h = frame.size.height
        
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        hourLine.frame = CGRect(x: w / 2 - hourLineSize / 2, y: hourLineOffset, width: hourLineSize, height: h/2 - hourLineOffset)
        hourLine.backgroundColor = hourLineColor
        
        topMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: 0, width: markerSize, height: markerLength)
        bottomMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: h - markerLength, width: markerSize, height: markerLength)
        leftMarker.frame = CGRect(x: 0, y: h / 2 - markerSize / 2, width: markerLength, height: markerSize)
        rightMarker.frame = CGRect(x: w - markerLength, y: h / 2 - markerSize / 2, width: markerLength, height: markerSize)
        
        for v in [topMarker, leftMarker, rightMarker, bottomMarker]{
            v.backgroundColor = markerColor
        }
        
        roundedView.backgroundColor = roundedViewColor
        roundedView.frame = CGRect(x: w / 2 - 8, y: h / 2 - 8, width: 16, height: 16)
        roundedView.layer.cornerRadius = 8
        
        layer.cornerRadius = frame.size.width / 2
        
        updateHours()
        
        if isSetuped { return }
        isSetuped = true
        
        addSubview(hourLine)

        for v in [topMarker, leftMarker, rightMarker, bottomMarker, hourLine, roundedView]{
            addSubview(v)
        }
        

        updateHours()
    }
    
    func updateHours(){
        let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle)
    }
}
