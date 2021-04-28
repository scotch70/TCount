//
//  FlightNumberView.swift
//  TCount
//
//  Created by L.T.A Neeft on 23/04/2021.
//

import SwiftUI

struct FlightNumberView: View {
    
    @State var flightNumber: String = ""
    
    var body: some View {
        VStack {
            LogoView()
            Text("Flight number")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Form {
                Section {
                    TextField("Flight number", text: $flightNumber)
                        .disableAutocorrection(true)
                        .padding()
                        .cornerRadius(5.0)
                }
            }
            NavigationLink(destination: SectionCountView(sectionViewModel: CountViewModel())) {
                Text("Retrieve data")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
        }
    }
}

struct FlightNumberView_Previews: PreviewProvider {
    static var previews: some View {
        FlightNumberView()
    }
}
