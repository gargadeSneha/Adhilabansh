//
//  CustomTextField.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 20/07/23.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
       @Binding var text: String
//    var isFieldValid: Bool
//        var validationMessage: String
//        var onEditingChanged: ((Bool) -> Void)?
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(.horizontal, 10.0)
            .frame(width: 340, height: 45)
            .background(Color.white)
            .cornerRadius(5)
            .position(x: 200, y: 145)
        
//        if !isFieldValid {
//                       Text(validationMessage).foregroundColor(.red).font(.footnote)
//                   }
    }

}

//struct CustomTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTextField()
//    }
//}
