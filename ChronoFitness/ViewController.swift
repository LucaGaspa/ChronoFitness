//
//  ViewController.swift
//  ChronoFitness
//
//  Created by Luca Gasparetto on 25/05/2019.
//  Copyright © 2019 gaspiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var clockOneView: UIView!
    @IBOutlet weak var clockOneLabel: UILabel!
    @IBOutlet weak var clockTwoView: UIView!
    @IBOutlet weak var clockTwoLabel: UILabel!
    @IBOutlet weak var clockThreeView: UIView!
    @IBOutlet weak var clockThreeLabel: UILabel!
    @IBOutlet weak var clockFourView: UIView!
    @IBOutlet weak var clockFourLabel: UILabel!
    @IBOutlet weak var clockFiveView: UIView!
    @IBOutlet weak var clockFiveLabel: UILabel!
    @IBOutlet weak var clockSixView: UIView!
    @IBOutlet weak var clockSixLabel: UILabel!
    
    let borderWidth = CGFloat(integerLiteral: 15)
    
    var shapeLayers: [CAShapeLayer] = []
    
    // tap gestures
    var tapOne: UITapGestureRecognizer?
    var tapTwo: UITapGestureRecognizer?
    var tapThree: UITapGestureRecognizer?
    var tapFour: UITapGestureRecognizer?
    var tapFive: UITapGestureRecognizer?
    var tapSix: UITapGestureRecognizer?
    
    // timers
    var timerOne:Timer?
    var timeLeftOne = 0
    var timerTwo:Timer?
    var timeLeftTwo = 0
    var timerThree:Timer?
    var timeLeftThree = 0
    var timerFour:Timer?
    var timeLeftFour = 0
    var timerFive:Timer?
    var timeLeftFive = 0
    var timerSix:Timer?
    var timeLeftSix = 0
    
    
    var views: [UIView]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.views = [self.clockOneView, self.clockTwoView, self.clockThreeView, self.clockFourView, self.clockFiveView, self.clockSixView]
        
        self.createLayer()
        
        // gesture recognizer
        tapOne = UITapGestureRecognizer(target: self, action: #selector(self.animateLayer(_:)))
        tapTwo = UITapGestureRecognizer(target: self, action: #selector(self.animateLayer(_:)))
        tapThree = UITapGestureRecognizer(target: self, action: #selector(self.animateLayer(_:)))
        tapFour = UITapGestureRecognizer(target: self, action: #selector(self.animateLayer(_:)))
        tapFive = UITapGestureRecognizer(target: self, action: #selector(self.animateLayer(_:)))
        tapSix = UITapGestureRecognizer(target: self, action: #selector(self.animateLayer(_:)))
        
        self.clockOneView.addGestureRecognizer(tapOne!)
        self.clockTwoView.addGestureRecognizer(tapTwo!)
        self.clockThreeView.addGestureRecognizer(tapThree!)
        self.clockFourView.addGestureRecognizer(tapFour!)
        self.clockFiveView.addGestureRecognizer(tapFive!)
        self.clockSixView.addGestureRecognizer(tapSix!)
    }
    
    @IBAction func onButtonPressed(_ sender: Any) {
        
    }
    
    @objc private func animateLayer(_ sender: UITapGestureRecognizer){
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 0
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        var index = 0
        switch sender {
        case self.tapOne:
            index = 0
            timeLeftOne = 30
            if timerOne != nil {
                self.clockOneLabel.text = timeLeftOne.formatToString()
                timerOne?.invalidate()
                timerOne = nil
                self.shapeLayers[index].removeAnimation(forKey: "urSoBasic")
            }else{
                basicAnimation.duration = CFTimeInterval(timeLeftOne)
                self.shapeLayers[index].add(basicAnimation, forKey: "urSoBasic")
                timerOne = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: index, repeats: true)
            }
        case self.tapTwo:
            index = 1
            timeLeftTwo = 60
            if timerTwo != nil {
                self.clockTwoLabel.text = timeLeftTwo.formatToString()
                timerTwo?.invalidate()
                timerTwo = nil
                self.shapeLayers[index].removeAnimation(forKey: "urSoBasic")
            }else{
                basicAnimation.duration = CFTimeInterval(timeLeftTwo)
                self.shapeLayers[index].add(basicAnimation, forKey: "urSoBasic")
                timerTwo = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: index, repeats: true)
            }
        case self.tapThree:
            index = 2
            timeLeftThree = 90
            if timerThree != nil {
                self.clockThreeLabel.text = timeLeftThree.formatToString()
                timerThree?.invalidate()
                timerThree = nil
                self.shapeLayers[index].removeAnimation(forKey: "urSoBasic")
            }else{
                basicAnimation.duration = CFTimeInterval(timeLeftThree)
                self.shapeLayers[index].add(basicAnimation, forKey: "urSoBasic")
                timerThree = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: index, repeats: true)
            }
        case self.tapFour:
            index = 3
            timeLeftFour = 120
            if timerFour != nil {
                self.clockFourLabel.text = timeLeftFour.formatToString()
                timerFour?.invalidate()
                timerFour = nil
                self.shapeLayers[index].removeAnimation(forKey: "urSoBasic")
            }else{
                basicAnimation.duration = CFTimeInterval(timeLeftFour)
                self.shapeLayers[index].add(basicAnimation, forKey: "urSoBasic")
                timerFour = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: index, repeats: true)
            }
        case self.tapFive:
            index = 4
            timeLeftFive = 150
            if timerFive != nil {
                self.clockFiveLabel.text = timeLeftFive.formatToString()
                timerFive?.invalidate()
                timerFive = nil
                self.shapeLayers[index].removeAnimation(forKey: "urSoBasic")
            }else{
                basicAnimation.duration = CFTimeInterval(timeLeftFive)
                self.shapeLayers[index].add(basicAnimation, forKey: "urSoBasic")
                timerFive = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: index, repeats: true)
            }
        case self.tapSix:
            index = 5
            timeLeftSix = 180
            if timerSix != nil {
                self.clockSixLabel.text = timeLeftSix.formatToString()
                timerSix?.invalidate()
                timerSix = nil
                self.shapeLayers[index].removeAnimation(forKey: "urSoBasic")
            }else{
                basicAnimation.duration = CFTimeInterval(timeLeftSix)
                self.shapeLayers[index].add(basicAnimation, forKey: "urSoBasic")
                timerSix = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires(sender:)), userInfo: index, repeats: true)
            }
        default:
            break
        }
    }
    
    @objc private func onTimerFires(sender: Timer) {
        
        switch sender {
        case timerOne:
            timeLeftOne -= 1
            self.clockOneLabel.text = timeLeftOne.formatToString()
        case timerTwo:
            timeLeftTwo -= 1
            self.clockTwoLabel.text = timeLeftTwo.formatToString()
        case timerThree:
            timeLeftThree -= 1
            self.clockThreeLabel.text = timeLeftThree.formatToString()
        case timerFour:
            timeLeftFour -= 1
            self.clockFourLabel.text = timeLeftFour.formatToString()
        case timerFive:
            timeLeftFive -= 1
            self.clockFiveLabel.text = timeLeftFive.formatToString()
        case timerSix:
            timeLeftSix -= 1
            self.clockSixLabel.text = timeLeftSix.formatToString()
        default:
            break
        }
        
        if timeLeftOne <= 0 {
            timerOne?.invalidate()
            timerOne = nil
        }
        if timeLeftTwo <= 0 {
            timerTwo?.invalidate()
            timerTwo = nil
        }
        if timeLeftThree <= 0 {
            timerThree?.invalidate()
            timerThree = nil
        }
        if timeLeftFour <= 0 {
            timerFour?.invalidate()
            timerFour = nil
        }
        if timeLeftFive <= 0 {
            timerFive?.invalidate()
            timerFive = nil
        }
        if timeLeftSix <= 0 {
            timerSix?.invalidate()
            timerSix = nil
        }
    }
    
    private func createLayer(){
        for x in 0...5 {
            self.shapeLayers.append(CAShapeLayer())
            
            let view = self.views![x]
            let circularPath = UIBezierPath(arcCenter: view.convert(view.center, from: view.superview), radius: (view.frame.width / 2) - (self.borderWidth / 2), startAngle: CGFloat.pi / 2, endAngle: -CGFloat.pi / 2, clockwise: true)
            
            shapeLayers[x].path = circularPath.cgPath
            shapeLayers[x].fillColor = UIColor.clear.cgColor
            shapeLayers[x].strokeColor = UIColor.init(ciColor: CIColor.init(red: 255, green: 144, blue: 12, alpha: 0.75)).cgColor
            shapeLayers[x].lineCap = CAShapeLayerLineCap.round
            shapeLayers[x].lineWidth = self.borderWidth
            view.layer.addSublayer(shapeLayers[x])
            view.layoutIfNeeded()
        }
    }
}

extension Int {
    func formatToString() -> String {
        let minutes = self / 60
        let seconds = self % 60
        return "\(String(format: "%02d", minutes)):\(String(format: "%02d", seconds))"
    }
}
