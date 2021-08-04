//
//  Find.swift
//  RTC
//
//  Created by Juliana Glodek on 8/4/21.
//

import SwiftUI

struct Find: View {
    
    @State var type: Int = 0
    @State var attribute: String = ""
    
    var body: some View {
            VStack {
                
                Form {
                    
                    Section(header: Text("Roles Offered")) {
                        
                        NavigationLink(
                            destination: Results(type: $type, attribute: $attribute),
                            label: {
                                Text("Internships - Fall 2021")
                            }).onAppear(perform: {
                                self.attribute = "Internships - Fall 2021"
                            })
                        
                        NavigationLink(
                            destination: Results(type: $type, attribute: $attribute),
                            label: {
                                Text("Internships - Winter/Spring 2022")
                            }).onAppear(perform: {
                                self.attribute = "Internships - Winter/Spring 2022"
                            })

                        NavigationLink(
                            destination: Results(type: $type, attribute: $attribute),
                            label: {
                                Text("Internships - Summer 2022")
                            }).onAppear(perform: {
                                self.attribute = "Internships - Summer 2022"
                            })
                        
                        NavigationLink(
                            destination: Results(type: $type, attribute: $attribute),
                            label: {
                                Text("New Grad Jobs")
                            }).onAppear(perform: {
                                self.attribute = "New Grad Jobs"
                            })

                    }
                    
                    Section(header: Text("Types of Opportunities")) {

                        NavigationLink(
                            destination: Results(type: $type, attribute: $attribute),
                            label: {
                                Text("Software Engineering/Development")
                            }).onAppear(perform: {
                                self.type = 1
                                self.attribute = "Software Engineering/Development"
                            })
                        
                        NavigationLink(
                            destination: Results(type: $type, attribute: $attribute),
                            label: {
                                Text("Data Science/Analysis")
                            }).onAppear(perform: {
                                self.type = 1
                                self.attribute = "Data Science/Analysis"
                            })
                        
                        NavigationLink(
                            destination: Results(type: $type, attribute: $attribute),
                            label: {
                                Text("UI/UX")
                            }).onAppear(perform: {
                                self.type = 1
                                self.attribute = "UI/UX"
                            })
                        
                        NavigationLink(
                            destination: Results(type: $type, attribute: $attribute),
                            label: {
                                Text("Cybersecurity")
                            }).onAppear(perform: {
                                self.type = 1
                                self.attribute = "Cybersecurity"
                            })
                        
                        NavigationLink(
                            destination: Results(type: $type, attribute: $attribute),
                            label: {
                                Text("Tech Consulting")
                            }).onAppear(perform: {
                                self.type = 1
                                self.attribute = "Tech Consulting"
                            })
                        
                        NavigationLink(
                            destination: Results(type: $type, attribute: $attribute),
                            label: {
                                Text("Product Design")
                            }).onAppear(perform: {
                                self.type = 1
                                self.attribute = "Product Design"
                            })
                        
                        NavigationLink(
                            destination: Results(type: $type, attribute: $attribute),
                            label: {
                                Text("Product Management")
                            }).onAppear(perform: {
                                self.type = 1
                                self.attribute = "Product Management"
                            })
                        
                        NavigationLink(
                            destination: Results(type: $type, attribute: $attribute),
                            label: {
                                Text("Hardware Engineering")
                            }).onAppear(perform: {
                                self.type = 1
                                self.attribute = "Hardware Engineering"
                            })

                    }
                    
                    
                }
                
                
            }

        }

}

struct Results: View {
    
    @Binding var type: Int
    @Binding var attribute: String
    @State var companyList = companies
    
    var body: some View {
        
        ScrollView {
            if type == 0 {

                    ForEach(companyList.filter({ (company: Company) -> Bool in
                        return company.roleTypes.contains(attribute)}), id: \.self) { company in
                       NavigationLink(destination: CompanyDetail(company: company, companyList: $companyList), label: {
                        CompanyRow(company: company)
                       })
                    }
                
            }
            
            else if type == 1 {
                    ForEach(companyList.filter({ (company: Company) -> Bool in
                        return company.roles.contains(attribute)}), id: \.self) { company in
                       NavigationLink(destination: CompanyDetail(company: company, companyList: $companyList), label: {
                        CompanyRow(company: company)
                       })
                    }
            }
        }
        
    }
}

struct Find_Previews: PreviewProvider {
    static var previews: some View {
        Find()
    }
}
