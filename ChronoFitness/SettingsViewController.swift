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
    @IBOutlet weak var clockTwoPicker: UIPickerView!
    @IBOutlet weak var clockThreePicker: UIPickerView!
    @IBOutlet weak var clockFourPicker: UIPickerView!
    @IBOutlet weak var clockFivePicker: UIPickerView!
    @IBOutlet weak var clockSixPicker: UIPickerView!
    
    
    var minutes = 0
    var seconds = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO:: set pickers
        self.clockOnePicker.selectRow(1, inComponent: 0, animated: true)
        self.clockTwoPicker.selectRow(1, inComponent: 0, animated: true)
        self.clockThreePicker.selectRow(1, inComponent: 0, animated: true)
        self.clockFourPicker.selectRow(1, inComponent: 0, animated: true)
        self.clockFivePicker.selectRow(1, inComponent: 0, animated: true)
        self.clockSixPicker.selectRow(1, inComponent: 0, animated: true)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        // TODO :: save preferences
        self.dismiss(animated: true, completion: nil)
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
            return 30
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
            return row == 1 ? "\(row) Minute" : "\(row) Minutes"
        case 1:
            return row == 1 ? "\(row) Second" : "\(row) Seconds"
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
