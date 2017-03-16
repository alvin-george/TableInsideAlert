//
//  ViewController.swift
//  SampleUIPickerCommon
//
//  Created by Pushpam Group on 16/03/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AlertTableControlDelegate, UIActionSheetDelegate {
    
    @IBOutlet var sampleButton: UIButton!
    @IBOutlet var sampleButton2: UIButton!
    
    var delegate : AlertTableControlDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        delegate =  self
        
        UserDefaults.standard.removeObject(forKey: "picker_selected_index")
        UserDefaults.standard.removeObject(forKey: "picker_selected_item")
    }
    override func viewWillAppear(_ animated: Bool) {
    sampleButton.setTitle(UserDefaults.standard.value(forKey: "picker_selected_item") as! String?, for: UIControlState.normal)
    }
    
    @IBAction func showPickerVC(_ sender: Any) {
        
        
        showLacartPickerView(currentViewControllerIdentifier: "searchFilterViewController", pickerViewItems: ["Test", "Lala", "Dadad","Test", "Lala", "Dadad","Test", "Lala", "Dadad","Test", "Lala", "Dadad"])
    }
    func showLacartPickerView(currentViewControllerIdentifier : String? ,pickerViewItems : [String]?)
    {
        let lacrtPickerView = self.storyboard?.instantiateViewController(withIdentifier: "pickerViewController") as! PickerViewController
        lacrtPickerView.pickerViewItems = pickerViewItems
        lacrtPickerView.currentViewController = currentViewControllerIdentifier!
        lacrtPickerView.modalPresentationStyle = .overCurrentContext
        self.present(lacrtPickerView, animated: true, completion: nil)
    }
    func getPickerData (selectedIndex : Int?, selectedItem : String?){
        //  sampleButton.setTitle(selectedItem, for: UIControlState.normal)
    }
    @IBAction func showPickerView(_ sender: Any) {
        
        let alert =  TableAlertController.init(title: "Sample Test", message: "Choose from Table", alertPreferredStyle : UIAlertControllerStyle.actionSheet , tableItems: ["Test", "Lala", "Dadad","Test", "Lala", "Dadad","Test", "Lala", "Dadad","Test", "Lala", "Dadad"])
        
        self.present(alert, animated: true, completion: nil)
        
        
        //let alertc = UIAlertController.init(title: "sa", message: "mmmm", preferredStyle: .alert)
       // self.present(alertc, animated: true, completion: nil)
        
    }
    func getSelectedItem(selectedItemIndex: Int?, selectedItemTitle: String?) {
        print("delegate working")
        
    }
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int){
        
        print(buttonIndex)
    }
    func showSelectedinALert(selected:String?)
    {
        
    sampleButton2.setTitle(selected , for: UIControlState.normal)
        
    }
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int){
        
        
        print(buttonIndex)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

