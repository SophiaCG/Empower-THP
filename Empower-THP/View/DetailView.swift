//
//  DetailView.swift
//  Empower-THP
//
//  Created by Sophia Gorgonio on 3/7/24.
//

import SwiftUI

// Displays SSN, date of birth, phone number and address
struct DetailView: View {
    @Binding var person: Person?
    @Binding var isPresented: Bool

    var body: some View {
        HStack {
            Spacer()
            
            // Exit button
            Button(action: {
                isPresented = false
            }, label: {
                Image(systemName: "multiply")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18, height: 18)
                    .foregroundStyle(.gray)
            })
        }.padding(30)

        VStack(alignment: .leading, spacing: 10) {
            Text("Social Security Number: ").bold() +
            Text("\(person?.socialSecurityNumber ?? "")")
            
            Text("Date of Birth: ").bold() +
            Text("\(person?.dateOfBirth ?? "")")
            
            Text("Phone Number: ").bold() +
            Text("\(person?.phoneNumber ?? "")")
            
            Text("Address: ").bold() +
            Text("\(person?.beneficiaryAddress?.firstLineMailing ?? "") \(person?.beneficiaryAddress?.city ?? ""), \(person?.beneficiaryAddress?.stateCode ?? "") \(person?.beneficiaryAddress?.zipCode ?? "") \(person?.beneficiaryAddress?.country ?? "")")
        }.padding()
        Spacer()
    }
}
