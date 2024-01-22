//
//  CountryDetailView.swift
//  Mobile_dev_1_final_project
//
//  Created by Chou-Ping Ding on 28.4.2023.
//

import SwiftUI


struct CountryDetailView: View {
    @Binding var country: Country
    
    var body: some View {
        VStack {
			//basic country information
            HStack{
                if country.isMember{
                    Image(systemName:"star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size:40.0))
                }
                else{
                    Image(systemName:"star.slash.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size:40.0))
                }
                
                if country.isEuroZone{
                    Image(systemName:"eurosign.square.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size:40.0))
                }
                if country.isSchengen{
                    Image(systemName:"checkmark.shield.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size:40.0))
                }
            }
            if country.isMember{
                Text("EU Membership: Yes")
            }
            else{
                Text("EU Membership: No")
            }
            if country.isEuroZone{
                Text("Euro Zone: Yes")
            }
            else{
                Text("Euro Zone: No")
            }
            if country.isSchengen{
                Text("Schengen Member: Yes")
            }
            else{
                Text("Schengen Member: No")
            }

            HStack{
                Image(systemName:"person.3.fill")
                Text("Population: \(country.population)")
            }
            Text("Population density: \(country.populationDensity) inhabitants / km\u{B2}")
			
			//link to wikipedia page of the country
            HStack{
                var url = "https://en.m.wikipedia.org/wiki/"+countryNameWikiForm(country.name)
                Image(systemName:"magnifyingglass")
                Link("\(country.name) on Wikipedia", destination: URL(string: url)!)
            }


        }
    }
}

			
//function to replace " "(space) in the country name to "_" so that wikipedia will take it
func countryNameWikiForm(_ CountryName: String)->String{
	let formatedName = CountryName.replacingOccurrences(of: " ", with: "_")
	return formatedName
}

struct CountryDetailView_Preview: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: .constant(Country(code: "FI", name: "Finland", area: 338_435, population: 5_555_300, isMember: true, isEuroZone: true, isSchengen: true)))
    }
}



