//
//  ListIconView.swift
//  Mobile_dev_1_final_project
//
//  Created by Chou-Ping Ding on 28.4.2023.
//

import SwiftUI

struct ListIconView: View {
    @State var country: Country
    //horizontal line up of icons showing the status of the countries  in the country navigation link list
    var body: some View {
        HStack{
			//country name
            Text("\(country.name)")
                .font(.system(size:20.0))
			//country flag
            Image(country.code.lowercased())
                .resizable()
                .frame(width: 30, height: 25)
                .border(.black)
			//star representing EU membership (crossed out if not)
            if country.isMember{
                Image(systemName:"star.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size:20.0))
            }
            else{
                Image(systemName:"star.slash.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size:20.0))
            }
			//Euro icon for the indication of Euro zone
            if country.isEuroZone{
                Image(systemName:"eurosign.square.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size:20.0))
            }
			//shield with checkmark indicating the country belongs to the Schengen area
            if country.isSchengen{
                Image(systemName:"checkmark.shield.fill")
                    .foregroundColor(.yellow)
                    .font(.system(size:20.0))
            }
        }
    }
}

struct ListIconView_Preview: PreviewProvider {
    static var previews: some View {
        ListIconView(country: Country(code: "FI", name: "Finland", area: 338_435, population: 5_555_300, isMember: true, isEuroZone: true, isSchengen: true))

    }
}
