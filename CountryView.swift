//
//  CountryView.swift
//  Mobile_dev_1_final_project
//
//  Created by Chou-Ping Ding on 28.4.2023.
//

import SwiftUI
// view of each country including the country information (implementing CountryDetailView) and large flag image 
struct CountryView: View {
    @State var country:Country
    var body: some View {
        
        VStack {
            Text("\(country.name)")
                .font(.largeTitle)
            
            Image(country.code.lowercased())
                .resizable()
                .scaledToFit()
                .border(Color.black, width: 1)
            CountryDetailView(country: $country)
        }
        .padding()
            }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(country: Country(code: "FI", name: "Finland", area: 338_435, population: 5_555_300, isMember: true, isEuroZone: true, isSchengen: true))
    }
}
