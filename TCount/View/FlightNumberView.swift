//
//  FlightNumberView.swift
//  TCount
//
//  Created by L.T.A Neeft on 23/04/2021.
//

import SwiftUI

struct FlightNumberView: View {
    @ObservedObject var flightViewModel = FlightNumberViewModel()
    
    var body: some View {
        VStack {
            LogoView()
            Text("Flight number")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text("Fill out in case A+C less then: 138 - (700) / 177 - (800)")
            Form {
                Section {
                    TextField("Flight number", text: $flightViewModel.flightNumbers)
                        .disableAutocorrection(true)
                        .padding()
                        .cornerRadius(5.0)
                }
            }
            NavigationLink(destination: SectionCountView(sectionViewModel: CountViewModel())) {
                TextView(text: "Retrieve Data")
            }
        }
        .padding()
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct FlightNumberView_Previews: PreviewProvider {
    static var previews: some View {
        FlightNumberView()
    }
}
