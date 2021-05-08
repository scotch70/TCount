//
//  TextView.swift
//  TCount
//
//  Created by L.T.A Neeft on 28/04/2021.
//

import SwiftUI

struct TextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
    }
}
