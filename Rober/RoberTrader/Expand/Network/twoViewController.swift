//
//  twoViewController.swift
//  Rober
//
//  Created by Hanxun on 17/2/8.
//  Copyright © 2017年 Hanxun. All rights reserved.
//

import UIKit
import Charts
import Alamofire
import SwiftyJSON



// MARK 代理的发送者
protocol MyDelegate {  // 代理协议，使用者要声明这个
    func doSomething(someName: String)  // 代理的方法，使用者要使用这个
}


class twoViewController: UIViewController, UITextFieldDelegate {

    // 创建一个闭包
    // 返回按键的点击事件
    
    
    var closer: ((String) -> ())?
    
    var textField: UITextField!
    var delegate: MyDelegate?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIButton()
        backButton.frame = CGRect(x: 100, y: 100, width: 60, height: 30)
        backButton.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        backButton.setTitle("返回", for: UIControlState.normal)
        backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        self.view.addSubview(backButton)
        
        
        let textField = UITextField(frame: CGRect(x: 100, y: 150, width: 200, height: 30))
        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.returnKeyType = UIReturnKeyType.done
        textField.placeholder = "你的名字"
        textField.delegate = self
        self.view.addSubview(textField)
        
        
        self.resigerNotifi()
        self.delegateAction()
        
//        let chartsView = BarChartView()
//        chartsView.frame = CGRect(x: 0, y: 200, width: self.view.frame.size.width, height: self.view.frame.size.height - 260)
//        chartsView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//        self.view.addSubview(chartsView)
//        chartsView.noDataText = "Hello"
        
//        let KLineView = CandleStickChartView()
        
        
//        self.AlamofireGet()
//        Alamofire.request("http://xixiangwangzhanjianshe.com/btc/BTCData.php?plat=1&priceType=1", method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
//            debugPrint(response)
//            
//            if let json = response.result.value {
//                print("JSON: \(json)")
//            }})
        Alamofire.request("http://xixiangwangzhanjianshe.com/btc/BTCData.php?plat=1&priceType=1").responseJSON { response in
            
            if let jsonData = response.result.value {
                print("JSON: \(jsonData)")
                let json = JSON(jsonData)
                
                if let buy = json["buy"].string {
                    print("买的价格是 \(buy)")
                }
            }
        }
    }
    
    
//    func AlamofireGet() {
//        Alamofire.request("https://xixiangwangzhanjianshe.com/btc/BTCData.php?plat=1&priceType=1", method: .post, parameters: nil, encoding: JSONEncoding.default, headers: [:]) {
//            .responseJSON { response in
//                print(response.request)  // original URL request
//                print(response.response) // URL response
//                print(response.data)     // server data
//                print(response.result)   // result of response serialization
//                
//                if let JSON = response.result.value {
//                    print("JSON: \(JSON)")
//                }
//            }
//
//        
//    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func backButtonAction() {
        print("我要返回了")
        if self.closer != nil {
            self.closer!("123")
        }
        self.navigationController!.popViewController(animated: true)
//        let GCDVC = GCDViewController()
//        self.navigationController?.pushViewController(GCDVC, animated: true)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("\(textField.text)")
        return true
    }
    
    func resigerNotifi() {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "notifiTest"), object: "123")
        
    }
    
    // MARK -
    // MARK 代理
    func delegateAction() {
        delegate?.doSomething(someName: "我是代理")
    }
}






