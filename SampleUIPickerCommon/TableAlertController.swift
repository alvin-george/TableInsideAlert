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
    
    func getSelectedItemFromAlert(selectedItemIndex : Int, selectedItemTitle : String?)
}

class TableAlertController: UIAlertController, UITableViewDataSource, UITableViewDelegate, UIActionSheetDelegate {
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    var alertTableView: UITableView!
    var tableController = UITableViewController()
    var alertTableViewArray = [String]()
    var alertSelectedIndex: Int = Int()
    
    var delegate:AlertTableControlDelegate!
    
    required public convenience init(title: String, message: String, alertPreferredStyle: UIAlertControllerStyle?, tableItems : [String]) {
        self.init()
        self.title = title
        self.message = message
        alertTableViewArray = tableItems
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        alertTableView = UITableView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y+10 , width: self.view.bounds.size.width-10, height: self.view.bounds.size.height))
        
        alertTableView.separatorStyle = .singleLine
        alertTableView.separatorColor =  UIColor.lightGray
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
    
    //Alert Table
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
        
        
        cell.contentView.backgroundColor =  UIColor.init(colorLiteralRed: 200, green: 30, blue: 38, alpha: 1.0)
        
        let label =  UILabel(frame : CGRect(x: 20, y: 0, width: self.view.bounds.size.width, height: 40))
        label.textColor =  UIColor.darkGray
        label.backgroundColor = UIColor.clear
        label.font = UIFont.init(name: "Helvetica", size: 17)
        cell.contentView.addSubview(label)
        label.text  = alertTableViewArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton(type: UIButtonType.custom)
        btn.tag = indexPath.row
        alertSelectedIndex =  indexPath.row
        
        delegate.getSelectedItemFromAlert(selectedItemIndex: indexPath.row, selectedItemTitle: alertTableViewArray[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell  = tableView.cellForRow(at: indexPath)
        cell!.contentView.backgroundColor = UIColor.cyan
    }
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell  = tableView.cellForRow(at: indexPath)
        cell!.contentView.backgroundColor = .clear
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        let verticalIndicator: UIImageView = (scrollView.subviews[(scrollView.subviews.count - 1)] as! UIImageView)
        verticalIndicator.backgroundColor = UIColor.red
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
