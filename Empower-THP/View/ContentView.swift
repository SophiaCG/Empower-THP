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
                    Button {
                        // Set the selected person and display modal when a cell is tapped
                        selectedPerson = person
                        isPresented = true
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(person.firstName ?? "") \(person.lastName ?? "")")
                                .bold()
                                .foregroundStyle(.black)
                            Text("\(person.beneType ?? "")")
                                .foregroundStyle(.black)
                            Text("\(person.designationCode == "P" ? "Primary" : "Contingent")")
                                .foregroundStyle(.black)
                        }

                    }
                }
            }
            .navigationTitle("Beneficiaries")
            .sheet(isPresented: $isPresented) {
                // Modal sheet with selected person's information
                DetailView(person: $selectedPerson, isPresented: $isPresented)
            }
        }
        .onAppear {
            // Call fetchData function to decode JSON file
            viewModel.fetchData()
        }
    }
}

#Preview {
    ContentView()
}
