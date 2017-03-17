//
//  ViewController.swift
//  SampleUIPickerCommon
//
//  Created by Pushpam Group on 16/03/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit


class ViewController: UIViewController, AlertTableControlDelegate,UIPickerControllerDataDelegate{
    
    @IBOutlet var sampleButton: UIButton!
    @IBOutlet var sampleButton2: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @IBAction func showPickerVC(_ sender: Any) {
        
        showLacartPickerView(currentViewControllerIdentifier: "searchFilterViewController", pickerViewItems: ["Test", "Lala", "Dadad","Test", "Lala", "Dadad","Test", "Lala", "Dadad","Test", "Lala", "Dadad"])
    }
    func showLacartPickerView(currentViewControllerIdentifier : String? ,pickerViewItems : [String]?)
    {
        let lacrtPickerView = self.storyboard?.instantiateViewController(withIdentifier: "pickerViewController") as! PickerViewController
        lacrtPickerView.pickerViewItems = pickerViewItems
        lacrtPickerView.currentViewController = currentViewControllerIdentifier!
        lacrtPickerView.delegate =  self
        
        lacrtPickerView.modalPresentationStyle = .overCurrentContext
        self.present(lacrtPickerView, animated: true, completion: nil)
    }
    
    @IBAction func showPickerView(_ sender: Any) {
        
        let alert =  TableAlertController.init(title: "Sample Test", message: "Choose from Table", alertPreferredStyle : UIAlertControllerStyle.actionSheet , tableItems: ["Test", "Lala", "Dadad","Test", "Lala", "Dadad","Test", "Lala", "Dadad","Test", "Lala", "Dadad"])
        alert.delegate = self
        self.present(alert, animated: true, completion: nil)
    }
    
    //Custom Delegates
    func getPickerData(selectedIndex : Int, selectedItem : String?){
        
        let buttonTitleString: String = "selectedItem :" + selectedItem!+", selectedIndex : " + String(describing: selectedIndex)
        sampleButton.setTitle(buttonTitleString, for: UIControlState.normal)
        
    }
    func getSelectedItemFromAlert(selectedItemIndex: Int, selectedItemTitle: String?) {
        
        let buttonTitleString: String = "selectedItem :" + selectedItemTitle! + ", selectedIndex : " + String(describing: selectedItemIndex)
        
        sampleButton2.setTitle(buttonTitleString, for: UIControlState.normal)
    }
      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

