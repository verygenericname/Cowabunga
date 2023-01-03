//
//  ContentView.swift
//  DockHider
//
//  Created by lemin on 1/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isVisible: Bool = true
    @State private var successful = false
    @State private var alertPresent = false
    
    var body: some View {
        VStack {
            Text("Dock Hider")
                .bold()
                .padding()
            HStack {
                Image(systemName: "platter.filled.bottom.iphone")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Toggle(isOn: $isVisible) {
                    Text("Dock Visible")
                        .minimumScaleFactor(0.5)
                }
                .padding(.leading, 10)
            }
            .padding(20)
            
            Button("Apply and respring", action: {
                successful = applyDock(isVisible: false)
            })
            .padding(10)
            .background(Color.accentColor)
            .cornerRadius(8)
            .foregroundColor(.white)
            .alert(isPresented: $alertPresent) {
                Alert(title: Text("Applied Status"), message: Text(String(successful)))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
