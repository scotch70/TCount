//
//  SectionCountView.swift
//  TCount
//
//  Created by L.T.A Neeft on 20/04/2021.
//

import SwiftUI

struct SectionCountView: View {
    @ObservedObject var viewModel = CountViewModel()
    
    var body: some View {
        HStack {
            AddSubtractButton(imageSubButton: "minus.circle")
            ZStack {
                Image("Cabin Layout")
                    .resizable()
                    .scaledToFit()
                VStack {
                    ForEach(viewModel.sections) { section in
                            Button(action: {
                               // viewModel.selectionBool(id: section.id)
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1)
                                    Text("\(section.section)")
                                }
                            }
                    }
                }
            }
            AddSubtractButton(imageSubButton: "plus.circle")
        }
        .padding()
        .navigationBarTitle(Text("Total: \(viewModel.total())"), displayMode: .inline)
    }
    
}

struct SectionCountView_Previews: PreviewProvider {
    static var previews: some View {
        SectionCountView(viewModel: CountViewModel())
    }
}
