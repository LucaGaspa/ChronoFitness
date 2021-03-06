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
    var clockOnePref = 30
    var timeLeftOne = 30
    
    var timerTwo:Timer?
    var clockTwoPref = 30
    var timeLeftTwo = 60
    
    var timerThree:Timer?
    var clockThreePref = 30
    var timeLeftThree = 90
    
    var timerFour:Timer?
    var clockFourPref = 30
    var timeLeftFour = 120
    
    var timerFive:Timer?
    var clockFivePref = 30
    var timeLeftFive = 150
    
    var timerSix:Timer?
    var clockSixPref = 30
    var timeLeftSix = 180
    
    
    var views: [UIView]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.isNavigationBarHidden = true
        
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
    
    override func viewDidAppear(_ animated: Bool) {
        // retrieve preferences
        let defaults = UserDefaults.standard
        let clockOnePref = defaults.integer(forKey: "\(AppDelegate.clockKey)1")
        if clockOnePref != 0 {
            self.clockOneLabel.text = clockOnePref.formatToString()
            self.clockOnePref = clockOnePref
            self.timeLeftOne = clockOnePref
        }
        let clockTwoPref = defaults.integer(forKey: "\(AppDelegate.clockKey)2")
        if clockTwoPref != 0 {
            self.clockTwoLabel.text = clockTwoPref.formatToString()
            self.clockTwoPref = clockTwoPref
            self.timeLeftTwo = clockTwoPref
        }
        let clockThreePref = defaults.integer(forKey: "\(AppDelegate.clockKey)3")
        if clockThreePref != 0 {
            self.clockThreeLabel.text = clockThreePref.formatToString()
            self.clockThreePref = clockThreePref
            self.timeLeftThree = clockThreePref
        }
        let clockFourPref = defaults.integer(forKey: "\(AppDelegate.clockKey)4")
        if clockFourPref != 0 {
            self.clockFourLabel.text = clockFourPref.formatToString()
            self.clockFourPref = clockFourPref
            self.timeLeftFour = clockFourPref
        }
        let clockFivePref = defaults.integer(forKey: "\(AppDelegate.clockKey)5")
        if clockFivePref != 0 {
            self.clockFiveLabel.text = clockFivePref.formatToString()
            self.clockFivePref = clockFivePref
            self.timeLeftFive = clockFivePref
        }
        let clockSixPref = defaults.integer(forKey: "\(AppDelegate.clockKey)6")
        if clockSixPref != 0 {
            self.clockSixLabel.text = clockFivePref.formatToString()
            self.clockSixPref = clockSixPref
            self.timeLeftSix = clockSixPref
        }
    }
    
    @IBAction func onButtonPressed(_ sender: Any) {
        self.timerOne?.invalidate()
        self.shapeLayers[0].removeAnimation(forKey: "urSoBasic")
        self.timerTwo?.invalidate()
        self.shapeLayers[1].removeAnimation(forKey: "urSoBasic")
        self.timerThree?.invalidate()
        self.shapeLayers[2].removeAnimation(forKey: "urSoBasic")
        self.timerFour?.invalidate()
        self.shapeLayers[3].removeAnimation(forKey: "urSoBasic")
        self.timerFive?.invalidate()
        self.shapeLayers[4].removeAnimation(forKey: "urSoBasic")
        self.timerSix?.invalidate()
        self.shapeLayers[5].removeAnimation(forKey: "urSoBasic")
        
        let settingsVC = self.storyboard?.instantiateViewController(withIdentifier: "SettingsViewControllerIdentifier") as! SettingsViewController
        self.present(settingsVC, animated: true, completion: nil)
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
            let isEnded = timerOne != nil || timeLeftOne <= 0
            timeLeftOne = clockOnePref
            if isEnded {
                self.clockOneLabel.text = (timeLeftOne).formatToString()
                timerOne?.invalidate()
                timerOne = nil
                self.shapeLayers[index].removeAnimation(forKey: "urSoBasic")
            }else{
                basicAnimation.duration = CFTimeInterval(timeLeftOne-1)
                self.shapeLayers[index].add(basicAnimation, forKey: "urSoBasic")
                timeLeftOne -= 1
                self.clockOneLabel.text = timeLeftOne.formatToString()
                timerOne = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: index, repeats: true)
            }
        case self.tapTwo:
            index = 1
            let isEnded = timerTwo != nil || timeLeftTwo <= 0
            timeLeftTwo = clockTwoPref
            if isEnded {
                self.clockTwoLabel.text = timeLeftTwo.formatToString()
                timerTwo?.invalidate()
                timerTwo = nil
                self.shapeLayers[index].removeAnimation(forKey: "urSoBasic")
            }else{
                basicAnimation.duration = CFTimeInterval(timeLeftTwo)
                self.shapeLayers[index].add(basicAnimation, forKey: "urSoBasic")
                timeLeftTwo -= 1
                self.clockTwoLabel.text = timeLeftTwo.formatToString()
                timerTwo = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: index, repeats: true)
            }
        case self.tapThree:
            index = 2
            let isEnded = timerThree != nil || timeLeftThree <= 0
            timeLeftThree = clockThreePref
            if isEnded {
                self.clockThreeLabel.text = timeLeftThree.formatToString()
                timerThree?.invalidate()
                timerThree = nil
                self.shapeLayers[index].removeAnimation(forKey: "urSoBasic")
            }else{
                basicAnimation.duration = CFTimeInterval(timeLeftThree)
                self.shapeLayers[index].add(basicAnimation, forKey: "urSoBasic")
                timeLeftThree -= 1
                self.clockThreeLabel.text = timeLeftThree.formatToString()
                timerThree = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: index, repeats: true)
            }
        case self.tapFour:
            index = 3
            let isEnded = timerFour != nil || timeLeftFour <= 0
            timeLeftFour = clockFourPref
            if isEnded {
                self.clockFourLabel.text = timeLeftFour.formatToString()
                timerFour?.invalidate()
                timerFour = nil
                self.shapeLayers[index].removeAnimation(forKey: "urSoBasic")
            }else{
                basicAnimation.duration = CFTimeInterval(timeLeftFour)
                self.shapeLayers[index].add(basicAnimation, forKey: "urSoBasic")
                timeLeftFour -= 1
                self.clockFourLabel.text = timeLeftFour.formatToString()
                timerFour = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: index, repeats: true)
            }
        case self.tapFive:
            index = 4
            let isEnded = timerFive != nil || timeLeftFive <= 0
            timeLeftFive = clockFivePref
            if isEnded {
                self.clockFiveLabel.text = timeLeftFive.formatToString()
                timerFive?.invalidate()
                timerFive = nil
                self.shapeLayers[index].removeAnimation(forKey: "urSoBasic")
            }else{
                basicAnimation.duration = CFTimeInterval(timeLeftFive)
                self.shapeLayers[index].add(basicAnimation, forKey: "urSoBasic")
                timeLeftFive -= 1
                self.clockFiveLabel.text = timeLeftFive.formatToString()
                timerFive = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: index, repeats: true)
            }
        case self.tapSix:
            index = 5
            let isEnded = timerSix != nil || timeLeftSix <= 0
            timeLeftSix = clockSixPref
            if isEnded {
                self.clockSixLabel.text = timeLeftSix.formatToString()
                timerSix?.invalidate()
                timerSix = nil
                self.shapeLayers[index].removeAnimation(forKey: "urSoBasic")
            }else{
                basicAnimation.duration = CFTimeInterval(timeLeftSix)
                self.shapeLayers[index].add(basicAnimation, forKey: "urSoBasic")
                timeLeftSix -= 1
                self.clockSixLabel.text = timeLeftSix.formatToString()
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
