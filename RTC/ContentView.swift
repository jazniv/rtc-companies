//
//  ContentView.swift
//  RTC
//
//  Created by Juliana Glodek on 8/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var companyList = companies
    @State private var searchText = ""
    @State var searching = false
    
    var body: some View {
        
        
        
        NavigationView {
            
            VStack(alignment: .leading) {
                
                Search(searchText: $searchText, searching: $searching)
                
                List {
                     ForEach(companyList.filter({ (company: Company) -> Bool in
                        return company.id.hasPrefix(searchText) || searchText == ""
                     }), id: \.self) { company in
                        NavigationLink(destination: CompanyDetail(company: company, companyList: $companyList), label: {
                                CompanyRow(company: company)
                        })
                     }
                 }.listStyle(GroupedListStyle())
                .navigationTitle(searching ? "Searching" : "Companies")
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
                .gesture(DragGesture()
                            .onChanged({ _ in
                                UIApplication.shared.dismissKeyboard()
                            })
                )
            }

        }
    }
}

struct Search: View {
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 225/255, green: 225/255, blue: 225/255))
            
            HStack {
                TextField("Search", text: $searchText) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searching = false
                    }
                }
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
        .frame(height: 40)
        .cornerRadius(13)
        .padding()
    }
}

extension UIApplication {
      func dismissKeyboard() {
          sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
  }
 

struct CompanyRow: View {
    
    var company: Company
    
    var body: some View {
        VStack(alignment: .leading, content: {
            Text(company.id)
                .fontWeight(.bold)
                .font(.title2)
                .accentColor(.black)
            Text(company.headline)
                .fontWeight(.light)
                .font(.footnote)
                .foregroundColor(.gray)
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


