//
//  PickerViewController.swift
//  PickerView
//
//  Created by iOS Developer on 12/9/16.
//  Copyright © 2016 Chantier. All rights reserved.
//

import UIKit

class PickerViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var toolbar: UIToolbar!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerViewItems: [String]?
    var doneButtonClick:((_ selectedIndex: Int)->Void)!
    var selectedIndex: Int = 0
   
    var currentViewController : String =  String()
    var targetViewController :UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate =  self
        
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let item = pickerViewItems {
            return item.count
        }
        return 0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let item = pickerViewItems {
            return item[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedIndex = row
    }
    
    @IBAction func doneButtonClicked(_ sender: AnyObject) {
        

            
            UserDefaults.standard.setValue(selectedIndex, forKey: "picker_selected_index")
            UserDefaults.standard.setValue(pickerViewItems?[selectedIndex], forKey: "picker_selected_item")
        
        let vc =  ViewController()
        vc.getPickerData(selectedIndex: selectedIndex, selectedItem: pickerViewItems?[selectedIndex])
        
            
            self.dismiss(animated: true, completion: nil)
        
    }

    @IBAction func cancelButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

