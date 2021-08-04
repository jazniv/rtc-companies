//
//  Grid.swift
//  RTC
//
//  Created by Juliana Glodek on 8/4/21.
//

import SwiftUI

struct Grid: View {

    @State var companyList = companies
    @State private var searchText = ""
    @State var searching = false
    
    let columns = [
        GridItem(.adaptive(minimum: 240))
    ]

    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                Search(searchText: $searchText, searching: $searching)
                

                LazyVGrid(columns: columns, spacing: 20) {
                    
                     ForEach(companyList.filter({ (company: Company) -> Bool in
                        return company.id.hasPrefix(searchText) || searchText == ""
                     }), id: \.self) { company in
                        NavigationLink(destination: CompanyDetail(company: company, companyList: $companyList), label: {
                                CompanyRow(company: company)
                        })
                     }
                    
                }
                .padding(.horizontal)
            }
            .frame(width: 400, height: 700, alignment: .bottom)
            .navigationTitle("Companies")
            .gesture(DragGesture()
                .onChanged({ _ in
                    UIApplication.shared.dismissKeyboard()
                }))
            .toolbar {
                         if searching {
                             Button("Cancel") {
                                 searchText = ""
                                 withAnimation {
                                     searching = false
                                    UIApplication.shared.dismissKeyboard()
                                 }
                             }
                         }
                     }
			.toolbar {
				NavigationLink(
					destination: Find(),
					label: {
						Text("Find")
					})
			}
			
        }
        
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        Grid()
    }
}
