//
//  GCDViewController.swift
//  Rober
//
//  Created by Hanxun on 17/2/9.
//  Copyright © 2017年 Hanxun. All rights reserved.
//

import UIKit

class GCDViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.GCDMain()
//        self.GCDGlobalQueue()
        self.BackQueue()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // GCD main 全局线程
    
    func GCDMain() {
        DispatchQueue.main.async {
            print("main  " + "\(Thread.current)")
        }
        
        
        DispatchQueue.global().sync {                  // 不开新线程
            print("global1  " + "\(Thread.current)")
        }
        
        DispatchQueue.global().async {                 // 开新线程
            print("global  " + "\(Thread.current)")
        }
    }
    
    func GCDGlobalQueue() {
        print("before  " + "\(Thread.current)")
        
        let globalQueue = DispatchQueue.global()
        for _ in 0...10 {
            globalQueue.async {
                print("task  " + "\(Thread.current)")
            }
        }
        
        print("after  " + "\(Thread.current)")
    }
    
    func BackQueue() {
        print("before  " + "\(Thread.current)")
        
        DispatchQueue.global().async {
            print("global  " + "\(Thread.current)")
            DispatchQueue.main.async {
                print("main  " + "\(Thread.current)")
            }
        }
        
        print("after  " + "\(Thread.current)")
    }
}









