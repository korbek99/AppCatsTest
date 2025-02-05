//
//  WebContentViewTests.swift
//  AppCatsTestTests
//
//  Created by Jose Preatorian on 04-02-25.
//

import XCTest
import XCTest
import SwiftUI
@testable import AppCatsTest

class WebContentViewTests: XCTestCase {
    
    var webContentView: WebContentView!
    
    override func setUpWithError() throws {
        let testURL = URL(string: "https://www.vetstreet.com/cats/bengal")!
        webContentView = WebContentView(url: testURL)
    }
    
    override func tearDownWithError() throws {
        webContentView = nil
        super.tearDown()
    }
    
    func testWebContentViewInitialization() throws {
        XCTAssertNotNil(webContentView)
    }
    
    func testWebViewLoadURL() throws {
        let webView = webContentView.body as? WebView
        XCTAssertEqual(webView?.url.absoluteString, "https://www.vetstreet.com/cats/bengal")
    }
 
    func testMakeUIViewLoadsURL() throws {
        let testURL = URL(string: "https://www.vetstreet.com/cats/bengal")!
        let webView = WebView(url: testURL)

        //let wkWebView = webView.makeUIView(context: Context())
//  
//        if let currentURL = wkWebView.url {
//            XCTAssertEqual(currentURL.absoluteString, testURL.absoluteString)
//        } else {
//            XCTFail("La URL no se cargó correctamente en WKWebView.")
//        }
    }
}
