import UIKit

@IBDesignable
class SecondClockView: UIView {
    
    var isSetuped = false
    
    @IBInspectable var hours: CGFloat = 11.5 {
        didSet { updateHours() }
    }
    
    @IBInspectable var minutes: CGFloat = 2 {
        didSet { updateMinutes() }
    }
    
    @IBInspectable var seconds: CGFloat = 0 {
        didSet { updateSeconds() }
    }
    
    private let hourLine = UIView()
    private let minLine = UIView()
    private let secLine = UIView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = frame.size.width
        let height = frame.size.height
        layer.cornerRadius = frame.size.width / 2
        
        setMinMarker(w: width, h: height)
        setHourMarker(w: width, h: height)
        setHourLine(w: width, h: height)
        setMinuteLine(w: width, h: height)
        setSecondLine(w: width, h: height)
        
        if isSetuped { return }
        isSetuped = true
        
        updateHours()
        updateMinutes()
        updateSeconds()
    }
    
    func setHourMarker(w: CGFloat, h: CGFloat) {
        for hour in 0...11 {
            let hourMarker = UIView()
            hourMarker.backgroundColor = UIColor.black
            hourMarker.layer.anchorPoint = CGPoint(x: 0.5, y: 5)
            hourMarker.frame = CGRect(x: w / 2 - w / 80, y: 0, width: w / 80 * 2, height: h / 10)
            let angle = CGFloat.pi * 2 * (CGFloat(hour) / CGFloat(12))
            hourMarker.transform = CGAffineTransform(rotationAngle: angle)
            addSubview(hourMarker)
        }
    }
    
    func setMinMarker(w: CGFloat, h: CGFloat) {
        for hour in 0...59 {
            let hourMarker = UIView()
            hourMarker.backgroundColor = UIColor.black
            hourMarker.layer.anchorPoint = CGPoint(x: 0.5, y: 7.5)
            hourMarker.frame = CGRect(x: w / 2 - w / 1000, y: 0, width: w / 1000 * 2, height: h / 15)
            let angle = CGFloat.pi * 2 * (CGFloat(hour) / CGFloat(60))
            hourMarker.transform = CGAffineTransform(rotationAngle: angle)
            addSubview(hourMarker)
        }
    }
    
    func setHourLine(w: CGFloat, h: CGFloat) {
            hourLine.backgroundColor = UIColor.black
            hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
            hourLine.frame = CGRect(x: w / 2 - w / 60, y: h / 6, width: w / 60 * 2, height: h / 3)
            addSubview(hourLine)
    }
    
    func setMinuteLine(w: CGFloat, h: CGFloat) {
            minLine.backgroundColor = UIColor.black
            minLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
            minLine.frame = CGRect(x: w / 2 - w / 80, y: h / 10, width: w / 80 * 2, height: h / 2.5)
            addSubview(minLine)
    }
    
    func setSecondLine(w: CGFloat, h: CGFloat) {
            secLine.backgroundColor = UIColor.red
            secLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
            secLine.frame = CGRect(x: w / 2 - w / 300, y: h / 20, width: w / 300 * 2, height: h / 2 - h / 20)
            addSubview(secLine)
    }
    
    func updateHours(){
        let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle)
        addSubview(hourLine)
    }
    
    func updateMinutes(){
        let angle = CGFloat.pi * 2 * (minutes / CGFloat(60))
        minLine.transform = CGAffineTransform(rotationAngle: angle)
        addSubview(minLine)
    }
    
    func updateSeconds(){
        let angle = CGFloat.pi * 2 * (seconds / CGFloat(60))
        secLine.transform = CGAffineTransform(rotationAngle: angle)
        addSubview(secLine)
    }
}
