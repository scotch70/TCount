//
//  AddSubtractButton.swift
//  TCount
//
//  Created by L.T.A Neeft on 11/04/2021.
//  Copyright © 2021 L.T.A Neeft. All rights reserved.
//

import SwiftUI

struct AddSubtractButton: View {
    @ObservedObject var viewModel = CountViewModel()
    var imageSubButton: String
    
    var body: some View {
        Button(action: {
            viewModel.decrementPoints(id: 1)
        }) {
            ZStack{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                Image(systemName: imageSubButton)
                    .renderingMode(.original)
                    .font(.largeTitle)
            }
        }
    }
}


