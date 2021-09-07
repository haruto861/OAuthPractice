//
//  ViewController.swift
//  OAuthPractice
//
//  Created by 松島悠人 on 2021/08/29.
//

import UIKit
import WebKit

final class ViewController: UIViewController {

    private var wkWebView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpWKWebView()
        loadWkWebView()
    }

    private func loadWkWebView() {
        let gitOauthUrl = URL(string: "https://github.com/login/oauth/authorize?client_id=f3cdf19da24ea768e7e9")
        let urlRequest = URLRequest(url: gitOauthUrl!)
        wkWebView.load(urlRequest)
    }

    private func setUpWKWebView() {
        let configuration = WKWebViewConfiguration()
        wkWebView = WKWebView(frame: view.frame, configuration: configuration)
        view.addSubview(wkWebView)
    }
}
