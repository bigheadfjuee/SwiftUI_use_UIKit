//
//  MyUIViewController.swift
//  SwiftUI_UIKit
//
//  Created by Tony on 2021/10/16.
//

import SwiftUI
import UIKit

// 舊專案用的 UIViewController
class MyViewController: UIViewController {
  
  public var textView : UITextView
  @Binding var myString: String
  
  // 要自行初始化 Binding<Type>
  init(myString: Binding<String>) {
    _myString = myString
    textView = UITextView(frame: CGRect(x: 20,y: 50,width: 300,height: 40))
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    debugPrint("MyViewController - viewDidLoad")
    debugPrint(myString)
    
    let title = UITextView(frame: CGRect(x: 10,y: 0,width: 300,height: 40))
    title.text = "MyViewController"
    title.font = .systemFont(ofSize: 16)
    view.addSubview(title)
    
    textView.font = .systemFont(ofSize: 16)
    textView.textColor = .yellow
    view.addSubview(textView)
    
    let btn = UIButton.init(type:.system) // system 按鈕才有顏色
    btn.frame = CGRect(x: 10, y: 100, width: 300, height: 40)
    btn.setTitle("==> MyViewController", for: .normal)
    btn.titleLabel?.font = .systemFont(ofSize: 16)
    btn.addTarget(self, action: #selector(changeText), for: .touchUpInside)
    view.addSubview(btn)
  }
  
  @objc func changeText() {
    // 可直接修改 @Binding 的值
    myString = "MyViewController"
  }
  
  
  override func viewLayoutMarginsDidChange() {
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
  }
}
