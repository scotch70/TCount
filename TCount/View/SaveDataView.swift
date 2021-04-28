//
//  SaveDataView.swift
//  TCount
//
//  Created by L.T.A Neeft on 28/04/2021.
//

import SwiftUI

struct SaveDataView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isToggle : Bool = false
    @ObservedObject var data = CountViewModel()

    
    var body: some View {
        VStack {
            Spacer()
            LogoView()
            VStack {
                Section {
                    Text("Save data:")
                        .font(.title3)
                    HStack {
                        Text("Flight number:")
                            .font(.headline)
                        Spacer()
                        Text("")
                    }
                    HStack {
                        Text("Date:")
                            .font(.headline)
                        Spacer()
                        Text(Date(), style: .date)
                    }
                    HStack {
                        Text("Total pax:")
                            .font(.headline)
                        Spacer()
                        Text("\(data.total)")
                    }
                    
                    Toggle(isOn: $isToggle){
                        Text("Pss performed:")
                            .font(.headline)
                    }
                }
                .padding()
            }
            Spacer()
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                Spacer()
                
                Button {
                    print("data saved")
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

struct SaveDataView_Previews: PreviewProvider {
    static var previews: some View {
        SaveDataView()
    }
}
