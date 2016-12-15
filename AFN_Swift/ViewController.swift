//
//  ViewController.swift
//  AFN_Swift
//
//  Created by 谢毅 on 16/12/15.
//  Copyright © 2016年 xieyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//  NetworkTools.sharedTools.request("http://www.weather.com.cn/data/sk/101010100.html", parameters: nil, finished: <#T##(result: AnyObject?, error: NSError?) -> ()#>)
        //尾随闭包
        NetworkTools.sharedTools.request(XieYiRequestMethod.GET,URLString: "http://httpbin.org/get", parameters: ["name":"xieyi"]){(result,error)->()in
            print(result)
        
        
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

