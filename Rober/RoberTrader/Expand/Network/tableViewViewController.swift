//
//  tableViewViewController.swift
//  Rober
//
//  Created by Hanxun on 17/2/10.
//  Copyright © 2017年 Hanxun. All rights reserved.
//

import UIKit

class tableViewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tableView = UITableView()
    var itemArr = ["唐朝", "宋", "元", "明"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // MARK: -
    // MARK: 初始化
    func tableViewInit() {
        self.view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate   = self
        
        tableView.frame = CGRect(x: 100, y: 100, width: 320, height: 400)
        tableView.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellString = "cellString"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellString)
        if cell == nil {
            cell = TableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: cellString)
        }
        return cell!
    }
}









