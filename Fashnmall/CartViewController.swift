//
//  CartViewController.swift
//  Fashnmall
//
//  Created by Ismailov Farrukh on 2021/5/5.
//

import UIKit
import WebKit


class CartViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    
    
    // MARK: - Variables
    var activityIndicator: UIActivityIndicatorView!
    lazy var webView: WKWebView = {
        let wv = WKWebView()
        wv.uiDelegate = self
        wv.navigationDelegate = self
        wv.translatesAutoresizingMaskIntoConstraints = false
        return wv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewConstraints()
        loadWebView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        statusBarBackgroundChange()
        viewReload()
        navigationBarCustomize()
    }
    
    
    func viewReload(){
        viewDidLoad()
    }
    
    // MARK: - Navigation Bar
    func navigationBarCustomize(){
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .white
            navigationController?.navigationBar.tintColor = .white
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.standardAppearance.shadowImage = UIImage()
            navigationController?.navigationBar.standardAppearance.shadowColor = .clear
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    // MARK: - Change status bar background color
    func statusBarBackgroundChange(){
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: statusBarHeight))
            statusbarView.backgroundColor = .white
            view.addSubview(statusbarView)
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = UIColor.white
        }
    }
    
    
    // MARK: - LOAD WEB VIEW
    func loadWebView(){
        activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        view.addSubview(activityIndicator)
        
        let url = URL(string: "https://fashnmall.com/cart")
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
        
    }
    
    
    // MARK: - sets constraints to webView
    func webViewConstraints(){
        view.addSubview(webView)
        NSLayoutConstraint.activate([
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.rightAnchor.constraint(equalTo: view.rightAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK:- WKNavigationDelegate
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("Start to load")
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Finish to load")
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
        activityIndicator.stopAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
        activityIndicator.stopAnimating()
        
    }
}
