//
//  EditTextField.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 02/08/23.
//

import SwiftUI

struct EditTextField: View {
    var placeholder: String
       @Binding var text: String
       @FocusState private var isFocused: Bool
    var body: some View {
        TextField(placeholder, text: $text)
            .font(.system(size: 20, weight: .medium))
            .padding(.horizontal, 10.0)
            .frame(width: 340, height: 45)
            .foregroundColor(.white)

        
        
    }
    
}
