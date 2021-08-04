//
//  CompanyRow.swift
//  RTC
//
//  Created by Juliana Glodek on 8/4/21.
//

import SwiftUI

struct CompanyRow: View {
    
    var company: Company
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 350, height: 150)
                .foregroundColor(.yellow)
                .cornerRadius(50)
            
            VStack {
                Text("")
                    .frame(width: 300, height: 30, alignment: .center)
                Text(company.id)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .frame(width: 250, height: 40, alignment: .center)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                    .accentColor(.black)
                Text(company.headline)
                    .fontWeight(.light)
                    .font(.system(size: 14))
                    .frame(width: 300, height: 70, alignment: .top)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                    .foregroundColor(.gray)
            }.frame(width: 300, height: 150, alignment: .bottom)
        }
        
        
    }
}

struct CompanyRow_Previews: PreviewProvider {
    static var previews: some View {
        CompanyRow(company: Company(id: "Apple", headline: "Join us. Be you.", description: "We're a diverse collective of thinkers and doers, continually reimagining what’s possible. And every new product, service, or feature we invent is the result of people working together to make each other’s ideas stronger.", roleTypes: ["New Grad Jobs", "Internships - Summer 2022"], roles: ["Software Engineering/Development", "Product Management", "UI/UX"], internOpen: "August 2021", internClose: "September 2021", newGradOpen: "August 2021", newGradClose: "Rolling", jobsUrl: "https://www.apple.com/careers/us/", contact: "Mary Jane mjane@apple.com"))
    }
}
