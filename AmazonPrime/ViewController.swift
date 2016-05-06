//
//  ViewController.swift
//  AmazonPrime
//
//  Created by Finn Gaida on 06.05.16.
//  Copyright © 2016 Finn Gaida. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    let mail = "enter your amazon email address"
    let pw = "enter your amazon prime password"
    let code = "enter the code of the show you want to watch"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let web = UIWebView()
        web.delegate = self
        web.frame = self.view.frame
        self.view.addSubview(web)
        
        guard let url = NSURL(string: "https://www.amazon.de/ap/signin?_encoding=UTF8&openid.assoc_handle=deflex&openid.claimed_id=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.identity=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0%2Fidentifier_select&openid.mode=checkid_setup&openid.ns=http%3A%2F%2Fspecs.openid.net%2Fauth%2F2.0&openid.ns.pape=http%3A%2F%2Fspecs.openid.net%2Fextensions%2Fpape%2F1.0&openid.pape.max_auth_age=0&openid.return_to=https%3A%2F%2Fwww.amazon.de%2Fgp%2Fyourstore%2Fhome") else { print("boo!"); return }
        web.loadRequest(NSURLRequest(URL: url))
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        guard let req = webView.request else { return }
        guard let url = req.URL else { return }
        
        if url.absoluteString.containsString("ap/signin") {
            _ = webView.stringByEvaluatingJavaScriptFromString("document.getElementById('ap_email').value='\(mail)'")
            _ = webView.stringByEvaluatingJavaScriptFromString("document.getElementById('ap_password').value='\(pw)'")
            _ = webView.stringByEvaluatingJavaScriptFromString("document.getElementById('signInSubmit').click();")
        }
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print(request)
        if let url = request.URL where url.absoluteString.containsString("/yourstore/") {
            guard let url = NSURL(string: "http://www.amazon.de/dp/\(code)/?autoplay=1") else { print("WTF"); return true }
            webView.loadRequest(NSURLRequest(URL: url))
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

