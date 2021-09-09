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
        wkWebView.uiDelegate = self
        wkWebView.navigationDelegate = self
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

    private func getAccessCode(url: String, param: String) -> String? {
        let url = URLComponents(string: url)
        print("queryItems",url?.queryItems ?? "")
        // "code"と一致した場合値を返す
        return url?.queryItems?.first {$0.name == param}?.value
    }
}

extension ViewController: WKNavigationDelegate {

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
        // code取得
        let code = getAccessCode(url: navigationAction.request.url?.absoluteString ?? "", param: "code")
        print("認可コード",code ?? "認可コードが取得できませんでした")
    }
}

extension ViewController: WKUIDelegate {

}
