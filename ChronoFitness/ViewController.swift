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
    var tapOne: UITapGestureRecognizer?
    var tapTwo: UITapGestureRecognizer?
    var tapThree: UITapGestureRecognizer?
    var tapFour: UITapGestureRecognizer?
    var tapFive: UITapGestureRecognizer?
    var tapSix: UITapGestureRecognizer?
    
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
            basicAnimation.duration = 30
            self.shapeLayers[0].add(basicAnimation, forKey: "urSoBasic")
            index = 0
            timeLeft = 30
        case self.tapTwo:
            basicAnimation.duration = 60
            self.shapeLayers[1].add(basicAnimation, forKey: "urSoBasic")
            index = 1
            timeLeft = 60
        case self.tapThree:
            basicAnimation.duration = 90
            self.shapeLayers[2].add(basicAnimation, forKey: "urSoBasic")
            index = 2
            timeLeft = 90
        case self.tapFour:
            basicAnimation.duration = 120
            self.shapeLayers[3].add(basicAnimation, forKey: "urSoBasic")
            index = 3
            timeLeft = 120
        case self.tapFive:
            basicAnimation.duration = 150
            self.shapeLayers[4].add(basicAnimation, forKey: "urSoBasic")
            index = 4
            timeLeft = 150
        case self.tapSix:
            basicAnimation.duration = 180
            self.shapeLayers[5].add(basicAnimation, forKey: "urSoBasic")
            index = 5
            timeLeft = 180
        default:
            break
        }
        
        if let timer = timer {
            timer.invalidate()
        }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: 0, repeats: true)
    }
    
    var timer:Timer?
    var timeLeft = 0
    @objc private func onTimerFires() {
        timeLeft -= 1
        
        switch timer?.userInfo as? Int {
        case 0:
            self.clockOneLabel.text = "\(timeLeft)"
        default:
            break
        }
        
        if timeLeft <= 0 {
            timer?.invalidate()
            timer = nil
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
        // One
        
        
        
        
        
        
        
    }
}

