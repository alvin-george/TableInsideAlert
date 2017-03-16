//
//  SamplePickerView.swift
//  SampleUIPickerCommon
//
//  Created by Pushpam Group on 16/03/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit

class SamplePickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    var groupObjList : [String] = []
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.groupObjList = ["My","Dadad","Test", "Lala", "Dadad","Test", "Lala", "Dadad","Test", "Lala", "Dadad"]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Delegates and data sources
    
    //    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    //        return 1
    //    }
    //
    //    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    //        return groupObjList.count
    //    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return groupObjList[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("picked \(groupObjList[row])")
        
    }
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        
        return 1
    }
    
    @available(iOS 2.0, *)
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return  groupObjList.count
        
    }
    
    
}
