//
//  NetworkTools.swift
//  AFN_Swift
//
//  Created by 谢毅 on 16/12/15.
//  Copyright © 2016年 xieyi. All rights reserved.
//

import UIKit
import AFNetworking //swift使用框架时，需要导入框架的文件夹名
//枚举
enum XieYiRequestMethod:String{
    case GET = "GET"
    case POST = "POST"



}

//MARK:网络工具
class NetworkTools: AFHTTPSessionManager {
    //单例
    static let sharedTools: NetworkTools = {
    
    let tools = NetworkTools(baseURL:nil)
    //设置反序列化 -Swift 系统会自动将OC框架中的NSSet转化为Set
        tools.responseSerializer.acceptableContentTypes?.insert("text/html")
    return tools
    }()
}
//MARK: - 封装AFN网络方法
extension NetworkTools{
//parameters:参数是要可选项，调用时才能穿nil
    
    /// 网路请求
    ///
    /// - parameter method:     Get/POST
    /// - parameter URLString:  URLString
    /// - parameter parameters: 参数字典
    /// - parameter finished:   完成回调
    func request(method:XieYiRequestMethod, URLString:String,parameters:[String:AnyObject]?,finished:(result:AnyObject?,error:NSError?)->()){
    
        //定义成功回调,当做参数进行传递
        let Success = {(task:NSURLSessionDataTask?, result:AnyObject?) -> Void in
           finished(result: result, error: nil)
        }
        
        //定义失败回调
        let failure = {(task:NSURLSessionDataTask?, error:NSError) -> Void in
            //在网络开发时，错误不需要提供给用户，但错误一定要输出
            finished(result: nil, error: error)

        }
        
        
        
        if method == XieYiRequestMethod.GET{
            
            GET(URLString, parameters: parameters, progress:nil, success: Success, failure: failure)
        }else{
        
           POST(URLString, parameters: parameters, progress:nil, success: Success, failure: failure)
        
        }
        
//        if method == XieYiRequestMethod.GET{
//            GET(URLString, parameters: parameters, progress: {
//                (NSProgress) -> Void in
//                
//                
//                }, success: { (_, result) -> Void in
//                    
//                    //            print(result)
//                    finished(result: result, error: nil)
//                    
//                }) { (_, error) -> Void in
//                    //在网络开发时，错误不需要提供给用户，但错误一定要输出
//                    finished(result: nil, error: error)
//                    print(error)
//            }
//        }else{
//        
//            POST(URLString, parameters: parameters, progress: {
//                (NSProgress) -> Void in
//                
//                
//                }, success: { (_, result) -> Void in
//                    
//                    //            print(result)
//                    finished(result: result, error: nil)
//                    
//                }) { (_, error) -> Void in
//                    //在网络开发时，错误不需要提供给用户，但错误一定要输出
//                    finished(result: nil, error: error)
//                    print(error)
//        
//        
//        }
//    
//    }

    }
}