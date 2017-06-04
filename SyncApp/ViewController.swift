//
//  ViewController.swift
//  SyncApp
//
//  Created by Jing Si on 4/18/17.
//  Copyright © 2017 Jing Si. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var SyncTableView: UITableView!
    @IBOutlet weak var syncButton: UIButton!
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref = FIRDatabase.database().reference()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func write() -> Void {
        let model = Model()
        for index in 0..<4 {
            let indexPath = IndexPath(row: index, section: 0)
            switch indexPath.row {
            case 0:
                let cell = SyncTableView.cellForRow(at: indexPath) as! TextFieldCell
                if cell.rightTextField.text != "" {
                    model.interval = cell.rightTextField.text
                }
            case 1:
                let cell = SyncTableView.cellForRow(at: indexPath) as! SwitchCell
                model.trigger = cell.rightSwitch.isOn
            case 2:
                let cell = SyncTableView.cellForRow(at: indexPath) as! LabelCell
                cell.rightLabel.text = Date().description
            case 3:
                let cell = SyncTableView.cellForRow(at: indexPath) as! PickerCell
                let durationStr = cell.picker.countDownDuration.description
                let duration = Double(durationStr)!
                let hours = Int(duration/3600)
                let minutes = Int((duration - Double(hours * 3600))/60.0)
                model.hours = String(hours)
                model.minutes = String(minutes)
            default:
                break
            }
        }
        if (model.interval) != nil {
            if model.trigger {
                self.ref.setValue(["folderName": "setFolderName", "hours": Int(model.hours)!, "interval": Int(model.interval)!, "minutes": Int(model.minutes)!, "picName": "IMAGE", "trigger": ["state": "ON"]])
            } else {
                self.ref.setValue(["folderName": "setFolderName", "hours": Int(model.hours)!, "interval": Int(model.interval)!, "minutes": Int(model.minutes)!, "picName": "IMAGE", "trigger": ["state": "OFF"]])
            }
            getAlert(title: "Notification", msg: "Updated Data With Cloud")
        } else {
            getAlert(title: "Warning", msg: "Please Set Interval Before Sync")
        }
        
    }
    

}

extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 3:
            return 130
        default:
            return 50
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = SyncTableView.dequeueReusableCell(withIdentifier: "TextFieldCell") as! TextFieldCell
            cell.leftLabel.text = "Interval:"
            return cell
        case 1:
            let cell = SyncTableView.dequeueReusableCell(withIdentifier: "SwitchCell") as! SwitchCell
            cell.leftLabel.text = "Trigger:"
            return cell
        case 2:
            let cell = SyncTableView.dequeueReusableCell(withIdentifier: "LabelCell") as! LabelCell
            cell.leftlabel.text = "Sync Time:"
            cell.rightLabel.text = "Not Sync Yet"
            return cell
        case 3:
            let cell = SyncTableView.dequeueReusableCell(withIdentifier: "PickerCell") as! PickerCell
            cell.picker.countDownDuration = 10
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
    func getAlert(title: String, msg: String) {
        let alertViewController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: {
            (action: UIAlertAction) -> Void in
            self.dismiss(animated: true, completion: nil)
        })
        
        alertAction.setValue(UIColor(red: 255.0/255.0, green: 114.0/255.0, blue: 88.0/255.0, alpha: 1.0), forKey: "titleTextColor")
        alertViewController.addAction(alertAction)
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

