//
//  SettingsViewController.swift
//  ChronoFitness
//
//  Created by Luca Gasparetto on 26/05/2019.
//  Copyright © 2019 gaspiz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var clockOnePicker: UIPickerView!
    @IBOutlet weak var clockOneButton: UIButton!
    
    var minutes = 0
    var seconds = 0
    var currentClock: Int = 1
    var currentButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let defaults = UserDefaults.standard
        let clockOnePref = defaults.integer(forKey: "\(AppDelegate.clockKey)1")
        if clockOnePref != 0 {
            let minutes = clockOnePref / 60
            let seconds = clockOnePref % 60
            self.clockOnePicker.selectRow(seconds, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(minutes, inComponent: 0, animated: true)
        }
        
        self.currentButton = self.clockOneButton
        self.highlightButton(current: self.currentButton!)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clockOneButtonPressed(_ sender: UIButton) {
        self.normalizeButton(current: self.currentButton!)
        self.currentButton = sender
        self.currentClock = 1
        self.highlightButton(current: self.currentButton!)
        
        let defaults = UserDefaults.standard
        let clockOnePref = defaults.integer(forKey: "\(AppDelegate.clockKey)1")
        if clockOnePref != 0 {
            self.minutes = clockOnePref / 60
            self.seconds = clockOnePref % 60
            self.clockOnePicker.selectRow(seconds, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(minutes, inComponent: 0, animated: true)
        }else{
            self.clockOnePicker.selectRow(30, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(0, inComponent: 0, animated: true)
            self.minutes = 0
            self.seconds = 30
        }
    }
    @IBAction func clockTwoButtonPressed(_ sender: UIButton) {
        self.normalizeButton(current: self.currentButton!)
        self.currentButton = sender
        self.currentClock = 2
        self.highlightButton(current: self.currentButton!)
        
        let defaults = UserDefaults.standard
        let clockTwoPref = defaults.integer(forKey: "\(AppDelegate.clockKey)2")
        if clockTwoPref != 0 {
            self.minutes = clockTwoPref / 60
            self.seconds = clockTwoPref % 60
            self.clockOnePicker.selectRow(seconds, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(minutes, inComponent: 0, animated: true)
        }else{
            self.clockOnePicker.selectRow(0, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(1, inComponent: 0, animated: true)
            self.minutes = 1
            self.seconds = 0
        }
    }
    @IBAction func clockThreeButtonPressed(_ sender: UIButton) {
        self.normalizeButton(current: self.currentButton!)
        self.currentButton = sender
        self.currentClock = 3
        self.highlightButton(current: self.currentButton!)
        
        let defaults = UserDefaults.standard
        let clockThreePref = defaults.integer(forKey: "\(AppDelegate.clockKey)3")
        if clockThreePref != 0 {
            self.minutes = clockThreePref / 60
            self.seconds = clockThreePref % 60
            self.clockOnePicker.selectRow(seconds, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(minutes, inComponent: 0, animated: true)
        }else{
            self.clockOnePicker.selectRow(30, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(1, inComponent: 0, animated: true)
            self.minutes = 1
            self.seconds = 30
        }
    }
    @IBAction func clockFourButtonPressed(_ sender: UIButton) {
        self.normalizeButton(current: self.currentButton!)
        self.currentButton = sender
        self.currentClock = 4
        self.highlightButton(current: self.currentButton!)
        
        let defaults = UserDefaults.standard
        let clockFourPref = defaults.integer(forKey: "\(AppDelegate.clockKey)4")
        if clockFourPref != 0 {
            self.minutes = clockFourPref / 60
            self.seconds = clockFourPref % 60
            self.clockOnePicker.selectRow(seconds, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(minutes, inComponent: 0, animated: true)
        }else{
            self.clockOnePicker.selectRow(0, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(2, inComponent: 0, animated: true)
            self.minutes = 2
            self.seconds = 0
        }
    }
    @IBAction func clockFiveButtonPressed(_ sender: UIButton) {
        self.normalizeButton(current: self.currentButton!)
        self.currentButton = sender
        self.currentClock = 5
        self.highlightButton(current: self.currentButton!)
        
        let defaults = UserDefaults.standard
        let clockFivePref = defaults.integer(forKey: "\(AppDelegate.clockKey)5")
        if clockFivePref != 0 {
            self.minutes = clockFivePref / 60
            self.seconds = clockFivePref % 60
            self.clockOnePicker.selectRow(seconds, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(minutes, inComponent: 0, animated: true)
        }else{
            self.clockOnePicker.selectRow(30, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(2, inComponent: 0, animated: true)
            self.minutes = 2
            self.seconds = 30
        }
    }
    @IBAction func clockSixButtonPressed(_ sender: UIButton) {
        self.normalizeButton(current: self.currentButton!)
        self.currentButton = sender
        self.currentClock = 6
        self.highlightButton(current: self.currentButton!)
        
        let defaults = UserDefaults.standard
        let clockSixPref = defaults.integer(forKey: "\(AppDelegate.clockKey)6")
        if clockSixPref != 0 {
            self.minutes = clockSixPref / 60
            self.seconds = clockSixPref % 60
            self.clockOnePicker.selectRow(seconds, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(minutes, inComponent: 0, animated: true)
        }else{
            self.clockOnePicker.selectRow(0, inComponent: 1, animated: true)
            self.clockOnePicker.selectRow(3, inComponent: 0, animated: true)
            self.minutes = 3
            self.seconds = 0
        }
    }
    
    private func highlightButton(current: UIButton) {
        current.layer.cornerRadius = 22
        current.layer.borderWidth = 3
        current.layer.borderColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 0.75).cgColor
    }
    
    private func normalizeButton(current: UIButton) {
        current.layer.cornerRadius = 0
        current.layer.borderWidth = 0
        current.layer.borderColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1).cgColor
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return 29
        case 1:
            return 60
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.size.width/2
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch component {
        case 0:
            return row == 0 ? "\(row) Minute" : "\(row) Minutes"
        case 1:
            return row == 0 ? "\(row) Second" : "\(row) Seconds"
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            minutes = row
        case 1:
            seconds = row
        default:
            break;
        }
        
        let defaults = UserDefaults.standard
        
        switch currentClock {
        case 1:
            defaults.set((minutes*60)+seconds, forKey: "\(AppDelegate.clockKey)1")
        case 2:
            defaults.set((minutes*60)+seconds, forKey: "\(AppDelegate.clockKey)2")
        case 3:
            defaults.set((minutes*60)+seconds, forKey: "\(AppDelegate.clockKey)3")
        case 4:
            defaults.set((minutes*60)+seconds, forKey: "\(AppDelegate.clockKey)4")
        case 5:
            defaults.set((minutes*60)+seconds, forKey: "\(AppDelegate.clockKey)5")
        case 6:
            defaults.set((minutes*60)+seconds, forKey: "\(AppDelegate.clockKey)6")
        default:
            return
        }
    }
}
