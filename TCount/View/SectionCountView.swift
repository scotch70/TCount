//
//  SectionCountView.swift
//  TCount
//
//  Created by L.T.A Neeft on 20/04/2021.
//

import SwiftUI
import Combine

struct SectionCountView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var sectionViewModel: CountViewModel
    @State private var plusOrMinus: SectionModel.Section?
    @State private var dataView: Bool = false
    
    @State private var timer: Timer?
    @State private var isLongPressing = false
    
    
    var body: some View {
        HStack {
            Button(action: {
                if(self.isLongPressing){
                    //this tap was caused by the end of a longpress gesture, so stop our fastforwarding
                    self.isLongPressing.toggle()
                    self.timer?.invalidate()
                } else {
                    //just a regular tap
                    if let buttonSelect = plusOrMinus  {
                        sectionViewModel.decreasePoints(section: buttonSelect)
                    }
                }
            }) {
                ZStack{
                    RoundedRectangle(cornerRadius: 10.0).fill(colorScheme == .dark ? Color.black : Color.white)
                    Image(systemName: "minus.circle")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.largeTitle)
                }
            }
            .simultaneousGesture(LongPressGesture(minimumDuration: 0.3).onEnded { _ in
                self.isLongPressing = true
                self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                    if let buttonSelect = plusOrMinus  {
                        sectionViewModel.decreasePoints(section: buttonSelect)
                    }
                })
            })
            
            ZStack {
                Image("Cabin Layout")
                    .resizable()
                    .scaledToFit()
                VStack {
                    ForEach(sectionViewModel.section) { section in
                        Button(action: {
                            sectionViewModel.chooseSection(section: section)
                            self.plusOrMinus = section
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10).stroke(Color(section.selected ? .green : colorScheme == .dark ? .white : .black), lineWidth: 2)
                                Text("\(section.section)")
                                    .font(.largeTitle)
                            }
                            
                        }
                    }
                }
            }
            Button(action: {
                if(self.isLongPressing){
                    //this tap was caused by the end of a longpress gesture, so stop our fastforwarding
                    self.isLongPressing.toggle()
                    self.timer?.invalidate()
                } else {
                    //just a regular tap
                    if let buttonSelect = plusOrMinus  {
                        sectionViewModel.incrementPoints(section: buttonSelect)
                    }
                }
            }) {
                ZStack{
                    RoundedRectangle(cornerRadius: 10.0).fill(colorScheme == .dark ? Color.black : Color.white)
                    Image(systemName: "plus.circle")
                        .foregroundColor(colorScheme == .dark ? .white : .black)
                        .font(.largeTitle)
                }
            }
            .simultaneousGesture(LongPressGesture(minimumDuration: 0.3).onEnded { _ in
                self.isLongPressing = true
                self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
                    if let buttonSelect = plusOrMinus  {
                        sectionViewModel.incrementPoints(section: buttonSelect)
                    }
                })
            })
        }
        .padding()
        .navigationBarTitle(Text("Total: \(sectionViewModel.totals)"), displayMode: .inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Text("Send data")
                    .onTapGesture {
                        dataView.toggle()
                    }
                    .foregroundColor(Color.green)
                    .sheet(isPresented: $dataView) {
                        SaveDataView(totalPax: sectionViewModel.totals)
                    }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    
    
}

