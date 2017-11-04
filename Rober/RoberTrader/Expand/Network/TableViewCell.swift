//
//  TableViewCell.swift
//  Rober
//
//  Created by Hanxun on 17/2/10.
//  Copyright © 2017年 Hanxun. All rights reserved.
//

import UIKit

open class TableViewCell: UITableViewCell {

    // MARK 视图声明
    var moneyNameView: UILabel?
    var moneyQuantity: UILabel?
    var moenyCNYValue: UILabel?
    var moenyUSDValue: UILabel?
    
    
    override open func awakeFromNib() {
        super.awakeFromNib()
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // 调用就好了
        self.initView()
        self.snapKitView()
    }

    // MARK -
    // MARK initView
    private func initView() {
        self.addSubview(moneyNameView!)
        self.addSubview(moneyQuantity!)
    }
    
    // MARK -snapKitView
    private func snapKitView() {
        moneyNameView?.frame = CGRect(x: 100, y: 100, width: 100, height: 30)
        moneyNameView?.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        moneyNameView?.text = "OKCoin"
    }
    
    // MARK -
    // MARK Ext Mothed
//    open func setCellData(_ data: DataClass) {
//        
//    }
}














