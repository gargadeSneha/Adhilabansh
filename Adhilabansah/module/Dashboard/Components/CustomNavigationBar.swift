//
//  CustomNavigationBar.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 26/07/23.
//

import SwiftUI

struct CustomNavigationBar: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var text: String
    var body: some View {
            HStack{
                Button(action : { self.presentationMode.wrappedValue.dismiss() }){
                    Image("left_arrow")
                    }
                    .frame(width: 40, height: 40, alignment: .center)
               Text(text)
                    .frame(width: 295, height: 40, alignment: .leading)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                Image("")
                    .frame(width: 40, height: 40, alignment: .center)
            }
            .padding(.bottom, 10)
            .border(width: 1, edges: [.bottom], color: Color.white)

            .position(x: 100, y: 5)
            .frame(width: 200)
    }
}

