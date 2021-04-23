//
//  SectionButtonView.swift
//  TCount
//
//  Created by L.T.A Neeft on 21/04/2021.
//

import SwiftUI

struct SectionButtonView: View {
    var number: Int
    var selected: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10).stroke(selected, lineWidth: 1)
            Text("\(number)")
        }
    }
}



