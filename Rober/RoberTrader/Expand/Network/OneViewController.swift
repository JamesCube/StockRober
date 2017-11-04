//
//  OneViewController.swift
//  Rober
//
//  Created by Hanxun on 17/2/8.
//  Copyright © 2017年 Hanxun. All rights reserved.
//
// ds-Rober

import UIKit

var oneLabel: UILabel!

class OneViewController: UIViewController, MyDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let oneButton = UIButton(type: .custom)
        oneButton.frame = CGRect(x: 100, y: 200, width: 100, height: 60)
        oneButton.setTitle("点击我", for: UIControlState.normal)
        oneButton.addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
        self.view.addSubview(oneButton)
        
        oneLabel = UILabel()
        oneLabel.frame = CGRect(x: 100, y: 100, width: 100, height: 60)
        oneLabel.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        oneLabel.text = "Test"
        self.view.addSubview(oneLabel)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(OneViewController.notifiAction123), name: NSNotification.Name(rawValue: "notifiTest"), object: nil)
        
        // MARK: -
        // MARK: 单例的使用
        single.shared.ParmrInit()
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
        print("销灰")
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tapped(_ button:UIButton) {
        
        print("已经被按下")
        let twoVC = twoViewController()
        twoVC.closer = {
            (backStr:String) -> Void in
            print("\(backStr)")
        }
        
        // 设置代理 
        twoVC.delegate = self
        
        self.navigationController?.pushViewController(twoVC, animated: true)
    }
    
    func notifiAction123() {
        print("1244")
    }
    
    
    // MARK -
    // MARK 代理
    func doSomething(someName: String) {
        print("\(someName)")
    }
}












