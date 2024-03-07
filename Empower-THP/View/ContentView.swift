//
//  ContentView.swift
//  Empower-THP
//
//  Created by Sophia Gorgonio on 3/7/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var selectedPerson: Person?
    @State private var isPresented: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.people, id: \.firstName) { person in
                    VStack(alignment: .leading) {
                        Text("\(person.firstName ?? "") \(person.lastName ?? "")")
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
                // Create and present your modal sheet here
                DetailView(person: $selectedPerson)
            }
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
}

//#Preview {
//    ContentView()
//}
