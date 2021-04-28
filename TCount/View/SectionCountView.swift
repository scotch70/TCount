//
//  SectionCountView.swift
//  TCount
//
//  Created by L.T.A Neeft on 20/04/2021.
//

import SwiftUI

struct SectionCountView: View {
    @ObservedObject var sectionViewModel: CountViewModel
    @State private var dataView: Bool = false
    
    
    var body: some View {
        HStack {
            AddSubtractButton(imageSubButton: "minus.circle")
            ZStack {
                Image("Cabin Layout")
                    .resizable()
                    .scaledToFit()
                VStack {
                    ForEach(sectionViewModel.section) { section in
                        Button(action: {
                            sectionViewModel.chooseSection(section: section)
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10).stroke(Color(section.selected ? .green : .black))
                                Text("\(section.section)")
                            }
                        }
                    }
                }
            }
            AddSubtractButton(imageSubButton: "plus.circle")
        }
        .padding()
        .navigationBarTitle(Text("Total: \(sectionViewModel.total)"), displayMode: .inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button {
                    dataView.toggle()
                } label: {
                    Label("Save", systemImage: "square.and.arrow.down")
                }
                .sheet(isPresented: $dataView) {
                    SaveDataView()
                }
            }
        }
    }
    
}

