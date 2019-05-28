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

        // TODO:: set pickers
        self.clockOnePicker.selectRow(0, inComponent: 0, animated: true)
        self.clockOnePicker.selectRow(0, inComponent: 1, animated: true)
        
        self.currentButton = self.clockOneButton
        self.highlightButton(current: self.currentButton!)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        // TODO :: save preferences
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clockOneButtonPressed(_ sender: UIButton) {
        self.normalizeButton(current: self.currentButton!)
        self.currentButton = sender
        self.highlightButton(current: self.currentButton!)
    }
    @IBAction func clockTwoButtonPressed(_ sender: UIButton) {
        self.normalizeButton(current: self.currentButton!)
        self.currentButton = sender
        self.highlightButton(current: self.currentButton!)
    }
    @IBAction func clockThreeButtonPressed(_ sender: UIButton) {
        self.normalizeButton(current: self.currentButton!)
        self.currentButton = sender
        self.highlightButton(current: self.currentButton!)
    }
    @IBAction func clockFourButtonPressed(_ sender: UIButton) {
        self.normalizeButton(current: self.currentButton!)
        self.currentButton = sender
        self.highlightButton(current: self.currentButton!)
    }
    @IBAction func clockFiveButtonPressed(_ sender: UIButton) {
        self.normalizeButton(current: self.currentButton!)
        self.currentButton = sender
        self.highlightButton(current: self.currentButton!)
    }
    @IBAction func clockSixButtonPressed(_ sender: UIButton) {
        self.normalizeButton(current: self.currentButton!)
        self.currentButton = sender
        self.highlightButton(current: self.currentButton!)
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
            return 59
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
            return row == 0 ? "\(row+1) Minute" : "\(row+1) Minutes"
        case 1:
            return row == 0 ? "\(row+1) Second" : "\(row+1) Seconds"
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
    }

}
