//
//  TableAlertController.swift
//  SampleUIPickerCommon
//
//  Created by Pushpam Group on 16/03/17.
//  Copyright © 2017 Pushpam Group. All rights reserved.
//

import UIKit
import Foundation

protocol AlertTableControlDelegate {
    
    func getSelectedItem(selectedItemIndex : Int?, selectedItemTitle : String?)
}


class TableAlertController: UIAlertController, UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate {
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var alertTableView: UITableView!
    var tableController = UITableViewController()
    var alertTableViewArray = [String]()
    var alertSelectedIndex: Int = Int()
    
    var alertTableControlDelegate:AlertTableControlDelegate!
    
    
    
    required public convenience init(title: String, message: String, alertPreferredStyle: UIAlertControllerStyle?, tableItems : [String]) {
        self.init()
        self.title = title
        self.message = message
        alertTableViewArray = tableItems
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      // self.preferredStyle = UIAlertControllerStyle.actionSheet
        
        alertTableView = UITableView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y+10 , width: self.view.bounds.size.width-10, height: self.view.bounds.size.height))
        
        alertTableView.separatorStyle = .none
        alertTableView.tag = 1
        alertTableView.isUserInteractionEnabled = true
        alertTableView.allowsSelection = true
        alertTableView.dataSource =  self
        alertTableView.delegate =  self
        
        tableController.preferredContentSize = CGSize(width: self.view.bounds.size.width, height: screenSize.height/4.5)
        tableController.tableView =  alertTableView
        self.setValue(tableController, forKey: "contentViewController")
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: {(action: UIAlertAction) -> Void in
            
        })
        self.addAction(cancelAction)
        //
        //        let doneAction = UIAlertAction(title: "Done", style: .default, handler: {(action: UIAlertAction) -> Void in
        //        })
        //self.addAction(doneAction)
        self.view.isUserInteractionEnabled = true
        
    }
    
    //SideMenu Table
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return alertTableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        let label =  UILabel(frame : CGRect(x: 20, y: 0, width: self.view.bounds.size.width, height: 40))
        label.textColor =  UIColor.darkGray
        label.font = UIFont.init(name: "Helvetica", size: 17)
        cell.contentView.addSubview(label)
        label.text  = alertTableViewArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        
        alertSelectedIndex =  indexPath.row
        alertTableControlDelegate?.getSelectedItem(selectedItemIndex: indexPath.row, selectedItemTitle: alertTableViewArray[indexPath.row])
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func actionSheet(_ actionSheet: UIActionSheet, clickedButtonAt buttonIndex: Int){
        
        print(buttonIndex)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
