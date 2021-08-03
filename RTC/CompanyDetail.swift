//
//  CompanyDetail.swift
//  RTC
//
//  Created by Juliana Glodek on 8/2/21.
//

import SwiftUI

struct CompanyDetail: View {
    var company: Company
    @Binding var companyList: [Company]
    
    var body: some View {
        
        VStack {
            
            Form {
                
                Section(header: Text("Description").bold()) {
                    Text(company.description)
                        .fontWeight(.light)
                        .font(.footnote)
                }
                
                Section(header: Text("Types of Roles")) {
                    ForEach(company.roleTypes, id: \.self) { role in
                        let myColor: Color = Color(UIColor.black)
                        
                        Text(role)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .foregroundColor(myColor)
                        
                    }
                }
                
                Section(header: Text("Roles Open")) {
                    
                    ForEach(company.roles, id: \.self) { role in

                        Text(role)
                            .font(.system(size: 14))
                            .fontWeight(.regular)
                            .foregroundColor(.black)
                        

                    }
                }
                
                Section(header: Text("Internship Dates")) {
                    HStack {
                        Text("Open: ")
                            .fontWeight(.light)
                            .font(.system(size: 14))
                        Text("\(company.internOpen)")
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                    }
                    
                    HStack {
                        Text("Close: ")
                            .fontWeight(.light)
                            .font(.system(size: 14))
                        Text("\(company.internClose)")
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                    }
                    
                }
                
                Section(header: Text("New Grad Dates")) {
                    HStack {
                        Text("Open: ")
                            .fontWeight(.light)
                            .font(.system(size: 14))
                        Text("\(company.newGradOpen)")
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                    }
                    
                    HStack {
                        Text("Close: ")
                            .fontWeight(.light)
                            .font(.system(size: 14))
                        Text("\(company.newGradClose)")
                            .fontWeight(.bold)
                            .font(.system(size: 14))
                    }
                    
                }
                
                Section(header: Text("Contact")) {
                    if URL(string: company.jobsUrl) != nil {
                        Link("Link to Job Post",
                             destination: URL(string: company.jobsUrl)!)
                    }
                    Text("Contact: \(company.contact)")
                        .fontWeight(.light)
                        .font(.system(size: 14))
                }
                
            }
            
            
            
            
        }
        .navigationTitle(company.id)
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

//
//struct CompanyDetail_Previews: PreviewProvider {
//
//    @State var companyList = companies
//    static var previews: some View {
//        
//        CompanyDetail(company: Company(id: "Apple", headline: "Join us. Be you.", description: "We're a diverse collective of thinkers and doers, continually reimagining what’s possible. And every new product, service, or feature we invent is the result of people working together to make each other’s ideas stronger.", roleTypes: ["New Grad Jobs", "Internships - Summer 2022"], roles: ["Software Engineering/Development", "Product Management", "UI/UX"], internOpen: "August 2021", internClose: "September 2021", newGradOpen: "August 2021", newGradClose: "Rolling", jobsUrl: "https://www.apple.com/careers/us/", contact: "Mary Jane mjane@apple.com"), companyList: $companyList)
//    }
//}
