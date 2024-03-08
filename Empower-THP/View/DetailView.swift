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

    var body: some View {
        VStack(alignment: .leading) {
            Text("\(person?.socialSecurityNumber ?? "")")
            Text("\(person?.dateOfBirth ?? "")")
            Text("\(person?.phoneNumber ?? "")")
            
            // Beneficiary's address
            Text("\(person?.beneficiaryAddress?.firstLineMailing ?? "")")
            Text("\(person?.beneficiaryAddress?.city ?? ""), \(person?.beneficiaryAddress?.stateCode ?? "") \(person?.beneficiaryAddress?.zipCode ?? "")")
            Text("\(person?.beneficiaryAddress?.country ?? "")")
        }
        .padding()
    }
}
