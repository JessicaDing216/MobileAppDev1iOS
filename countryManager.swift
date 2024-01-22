//
//  countryManager.swift
//  Mobile_dev_1_final_project
//
//  Created by Chou-Ping Ding on 28.4.2023.
//

import Foundation


class CountryManager: ObservableObject{

	//loading data from online database
    @Published var countries: [Country]
    
    init(){
        self.countries=[]
        self.loadCountrieswithUrlSession()
    }
   
    let urlString = "https://wy3dsyi6k62vlns5tmm72zlbcu0vnxda.lambda-url.eu-north-1.on.aws"
    
    private func loadCountrieswithUrlSession(){
        if let url = URL(string: urlString){
            print("about to hit lambda function url to get countries data")
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let jsonData = data {
                    let decoder = JSONDecoder()
                    if let countries = try? decoder.decode([Country].self, from: jsonData){
                        print("countries loaded from lambda")
                        DispatchQueue.main.async {
                            self.countries = []
                        }
                        for country in countries {
                            DispatchQueue.main.async {
                                self.countries.append(country)
                            }
                        }
                    }
                }
                else if let error = error {
                    print("unable to retrive json data \(error)")
                }
            }
            task.resume()
        }
        else{
            print("bad url")
        }
    }	

}
