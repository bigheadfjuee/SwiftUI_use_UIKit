//
//  MyUIViewCtrl.swift
//  SwiftUI_UIKit
//
//  Created by Tony on 2021/10/16.
//

import Foundation
import UIKit
import SwiftUI

// 使用 UIViewControllerRepresentable 可以整合到 SwiftUI 中使用
struct MyUIKitControl : UIViewControllerRepresentable {

  typealias UIViewControllerType = MyViewController
  
  @Binding var myString: String
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    debugPrint("makeUIViewController")
    
    let vc = MyViewController(myString: $myString)
    vc.textView.text = myString
    return vc
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    debugPrint("updateUIViewController")
    
    // 在這裡更新 @Binding 在 ViewController 裡的顯示
    uiViewController.textView.text = "myString: \(myString)"
  }
  
  // 使用 Coordinator 傳送 SwiftUI 的 @Binding
  func makeCoordinator() -> Coordinator {
    debugPrint("makeCoordinator")
      return Coordinator(myString: $myString)
  }
  
  class Coordinator: NSObject {
      @Binding var myString: String

      init(myString: Binding<String>) {
        debugPrint("Coordinator - init")
          _myString = myString
      }
      
  }
}
