//
//  ContentView.swift
//  Mobile_dev_1_final_project
//
//  Created by Chou-Ping Ding on 28.4.2023.
//

import SwiftUI

struct ContentView: View {
	//main view with a list of navigation links to different countries.
	//list is seperated in to sections depanding on its EU membership status
    @EnvironmentObject var manager:CountryManager
    @State private var MemberSelector: UUID?
    var body: some View {        
        NavigationStack{
            List() {
                Section(header: Text("EU Member")){
                    ForEach(manager.countries){country in
                        if(country.isMember){
                            NavigationLink{
                                CountryView(country: country)
                            }label: {
                                ListIconView(country: country)
                            }
                        }
                    }
                }
                Section(header: Text("None EU Member")){
                    ForEach(manager.countries){country in
                        if(!country.isMember){
                            NavigationLink{
                                CountryView(country: country)
                            }label: {
                                ListIconView(country: country)
                            }
                        }
                    }
                }
            }
            .navigationTitle("European Countries")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CountryManager())
    }
}
