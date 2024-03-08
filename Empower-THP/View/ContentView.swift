//
//  ContentView.swift
//  Empower-THP
//
//  Created by Sophia Gorgonio on 3/7/24.
//

import SwiftUI

// Displays list of beneficiaries with their first name, last name, beneficiary type, and designation
struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var selectedPerson: Person?
    @State private var isPresented: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.people, id: \.firstName) { person in
                    VStack(alignment: .leading) {
                        Text("\(person.firstName ?? "") \(person.lastName ?? "")").bold()
                        Text("\(person.beneType ?? "")")
                        Text("\(person.designationCode == "P" ? "Primary" : "Contingent")")
                    }
                    .onTapGesture {
                        // Set the selected person when the cell is tapped
                        selectedPerson = person
                        isPresented = true
                    }
                }
            }
            .navigationTitle("Beneficiaries")
            .sheet(isPresented: $isPresented) {
                // Modal sheet with selected person's information
                DetailView(person: $selectedPerson)
            }
        }
        .onAppear {
            // Call fetchData function to decode JSON file
            viewModel.fetchData()
        }
    }
}

//#Preview {
//    ContentView()
//}
