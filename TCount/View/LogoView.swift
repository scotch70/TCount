//
//  LogoView.swift
//  TCount
//
//  Created by L.T.A Neeft on 11/04/2021.
//  Copyright © 2021 L.T.A Neeft. All rights reserved.
//

import SwiftUI

struct LogoView: View {
    @State private var spin = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 15.0)
                .opacity(0.2)
                .frame(width: 150, height: 150)
                .foregroundColor(Color.green)
                .padding()
            Image(systemName: "airplane")
                .font(.system(size: 26, weight: .ultraLight))
                .offset(y: -75)
                .rotationEffect(.degrees(spin ? 0 : 360))
                .animation(Animation.linear(duration: 5).repeatCount(1, autoreverses: false))
                .onAppear(){ self.spin.toggle() }
            
             Text("t")
                .font(.system(size: 60))
                .bold()
                .foregroundColor(.green)
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
