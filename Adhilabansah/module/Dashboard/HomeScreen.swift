//
//  HomeScreen.swift
//  Adhilabansah
//
//  Created by Sneha Gargade on 18/07/23.
//

import SwiftUI

struct HomeScreen: View {
    @Binding var userId: Int
    let data = ["Group_277","Group_278"]
    let layout = [
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("Group_308")
                    .resizable()
                    .edgesIgnoringSafeArea(.top)
                    .edgesIgnoringSafeArea(.bottom)
                HStack{
                    if userId == 5 {
                        Text("Distributor")
                            .frame(width: 80)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    } else if userId == 6 {
                        Text("Retailer")
                            .frame(width: 80)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    } else if userId == 7 {
                        Text("Electrician")
                            .frame(width: 80)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    } else if userId == 8 {
                        Text("Customer")
                            .frame(width: 80)
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }
                    NavigationLink(destination: Profile()) {
                        Image("approve")
                            .padding(.trailing, 10)
                    }.buttonStyle(PlainButtonStyle())

                }
                .frame(width: 250, height: 50, alignment: .trailing)
                .position(x: 250, y: 0)
                VStack {
                    Image("Alemac_App_Logo")
                        .position(x: 200, y: -70)
                        .aspectRatio(contentMode: .fit)
                }.padding(.bottom, 15)
                
                if userId == 7 || userId == 8 {
                    HStack{
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: layout, spacing: 10){
                                
                                ForEach(data, id: \.self) { item in
                                    NavigationLink( destination : Brochure()) {
                                        ZStack (alignment: .center){
                                            Image(data[0])
                                        }.frame(width: 250, height: 50)
                                            .position(x: 130, y: 230)
                                    }
                                }.padding(.horizontal)
                            }
                        }
                    }
                }
                
                HStack{
                    VStack{
                        Text("Claimed").font(.system(size: 15))
                            .foregroundColor(.white)
                        Text("₹ 105").bold()
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                        
                        
                    }
                     .frame(width: 120, height: 90, alignment: .center)

                        VStack{
                            VStack{
                                VStack{
                                    Text("Processing").font(.system(size: 10))
                                        .foregroundColor(.white)
                                    Text("₹ 105").bold()
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                }
                                .frame(width: 120, height: 43, alignment: .center)
                                .border(width: 1, edges: [.bottom], color: .yellow)
                            }
                            .frame(width: 105, height: 50)
                            VStack{
                                VStack{
                                    Text("Pending").font(.system(size: 10))
                                        .foregroundColor(.white)
                                    Text("₹ 105").bold()
                                        .font(.system(size: 16))
                                        .foregroundColor(.white)
                                }
                            }
                            .frame(width: 120, height: 45)
                            .position(x: 60, y: 10)
                        }
                        .frame(width: 125, height: 95, alignment: .center)
                        .border(width: 1, edges: [.leading], color: .yellow)
                        .cornerRadius(50, corners: [.topRight, .bottomRight])
                }
                .border(Color.yellow, width: 1, cornerRadius: 50)
                .frame(width: 90, height: 90, alignment: .trailing)
                .position(x: userId == 7 || userId == 8 ?  280: 280, y: userId == 7 || userId == 8 ? 370 :230)
                
              
                    NavigationLink(destination: Brochure()) {
                        Text("COMPANY BROCHURE")
                            .frame(width: 200, height: 45)
                            .background(.red)
                            .font(.system(size: 15))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .position(x: 200, y: userId == 5 || userId == 6 ? 500: 600)
                    }.buttonStyle(PlainButtonStyle())
            }
           
            }.onAppear{print("HomeID: ", userId)}
            .navigationBarBackButtonHidden(true)
        }
    }

// MARK: - Extensions
struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
struct EdgeBorder: Shape {
    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        edges.map { edge -> Path in
            switch edge {
            case .top: return Path(.init(x: rect.minX, y: rect.minY, width: rect.width, height: width))
            case .bottom: return Path(.init(x: rect.minX, y: rect.maxY - width, width: rect.width, height: width))
            case .leading: return Path(.init(x: rect.minX, y: rect.minY, width: width, height: rect.height))
            case .trailing: return Path(.init(x: rect.maxX - width, y: rect.minY, width: width, height: rect.height))
            }
        }.reduce(into: Path()) { $0.addPath($1) }
    }
}
extension View {
    func border(_ color: Color, width: CGFloat, cornerRadius: CGFloat) -> some View {
        overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(color, lineWidth: width))
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
extension View {
    func border(width: CGFloat, edges: [Edge], color: Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
