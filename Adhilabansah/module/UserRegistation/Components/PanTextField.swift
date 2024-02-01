//
//  PanTextField.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 21/07/23.
//

import SwiftUI

struct PanTextField: View {
    var placeholder: String
    @Binding var text: String
    @State private var panCamera = false
    var body: some View {
        
        HStack(spacing: 90){
            TextField(placeholder, text: $text)
                .padding(.horizontal, 10.0)
                .frame(width: 280, height: 45)
                .background(Color.white)
                .cornerRadius(5)
                .position(x: 172, y: 145)
            HStack{
                Button(action: {
                    
                   panCamera.toggle()
                }){
                    Image("Camera_icon")
                }.frame(width: 50)
                    .position(x: 100, y: 145 )
            }
            }
            
            
//Spacer()
    }
    }


//struct PanTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        PanTextField()
//    }
//}
