//
//  WebViewViewController.swift
//  Lab4_Movie_Search_App
//
//  Created by Anh Le on 11/9/20.
//  Copyright © 2020 Anh Le. All rights reserved.
//

import UIKit
import WebKit

class WebViewViewController: UIViewController, WKNavigationDelegate {

    var myURLRequest: URLRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let webView:WKWebView = WKWebView(frame: CGRect(x: 0, y: 30, width: view.frame.width, height: view.frame.height-30))
        webView.navigationDelegate = self
        webView.load(myURLRequest!)
        webView.allowsBackForwardNavigationGestures = true
        
        self.view.addSubview(webView)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
