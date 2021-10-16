//
//  ContentView.swift
//  SwiftUI_UIKit
//
//  Created by Tony on 2021/10/16.
//

import SwiftUI

struct ContentView: View {
  @State var myString = "Hello MyControl"
    var body: some View {
      VStack() {
        Text("SwiftUI").padding()
        Text("myString: \(myString)")
          .foregroundColor(.yellow)
          .padding()
        Button("=> SwiftUI", action: { myString = "SwiftUI"}).padding()
        
        Spacer()
        // SwiftUI 可以取用 UIViewController 的元件
        MyUIKitControl(myString: $myString)
      }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
