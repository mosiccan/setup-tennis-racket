//
//  SwiftUIView.swift
//  
//
//  Created by 강우원 on 2023/04/15.
//

import SwiftUI

struct WeightView: View {
    @State private var racketWeight = 300.0
        
        var body: some View {
            HStack{
                Spacer()
                ZStack{
                    VStack {
                        Spacer()
                        Text("\(Int(racketWeight)) Gram")
                            .font(.system(size: 40))
                            .padding()
                        HStack{
                            Text("Light")
                            Slider(value: $racketWeight, in: 200...400, step: 1)
                                .padding()
                                .frame(width: 300)
                            Text("Heavy")
                                .bold()
                        }
                        Spacer()
                        Text("Light Weight")
                            .opacity(racketWeight <= 280 ? 0.5 : 0.0)
                            .font(.system(size: 80, weight: .light))
                        Text("Medium Weight")
                            .opacity((racketWeight > 280 && racketWeight <= 325) ? (racketWeight - 280) / 45.0 : 0.0)
                            .font(.system(size: 80, weight: .regular))
                        Text("Heavy Weight")
                            .opacity(racketWeight > 325 ? (racketWeight - 325) / 75.0 : 0.0)
                            .font(.system(size: 80, weight: .heavy))
                        Spacer()
                    }
                    .padding()
                }
                Spacer()
                VStack {
                    // 오른쪽 설명 뷰
                    VStack(alignment: .leading) {
                        Text(racketWeight <= 280 ? "Light Weight" : (racketWeight >= 325 ? "Heavy Weight" : "Medium Weight"))
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text(racketWeight <= 280 ? "A lot of power but little control" : (racketWeight >= 325 ? "High control and maneuverability" :"Medium power and Average shot control"))
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                            .padding(.bottom)
                        Text(racketWeight <= 280 ? "Lighter racquets are typically easier to swing and maneuver and offer up effortless power but tend to provide less overall stability and control when hitting. " : (racketWeight >= 325 ? "They are better suited for advanced and stronger players." :"They provide a nice balance between power and control, and offer decent maneuverability."))
                        Text(racketWeight <= 280 ? "As a result, these racquets are great options for beginners or players who have limited strength and shorter, compact swings." : (racketWeight >= 325 ? "These rackets offer great control, but you will need to generate a lot of power on your own. They are also very maneuverable." :"As racket performance improves, even professional players are choosing them over heavier rackets."))
                            .padding(.bottom)
        //                VStack(alignment: .trailing){
        //                    Text("Power")
        //                        .font(.title)
        //                    Text("Medium")
        //                        .font(.title3)
        //                        .foregroundColor(.blue)
        //                        .padding(.bottom)
        //
        //                    Text("Control")
        //                        .font(.title)
        //
        //                    Text("Medium")
        //                        .font(.title3)
        //                        .foregroundColor(.blue)
        //                        .padding(.bottom)
        //
        //                    Text("Maneuverability")
        //                        .font(.title)
        //                    Text("Medium")
        //                        .font(.title3)
        //                        .foregroundColor(.blue)
        //                        .padding(.bottom)
        //
        //                    Text("Ideal For")
        //                        .font(.title)
        //                    Text("Intermediate and Advanced Players")
        //                        .font(.title3)
        //                        .foregroundColor(.blue)
        //                        .padding(.bottom)
        //                }
                        Spacer()
                    }
                    .frame(maxWidth: 400)
                    
                }
                .padding()
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 2)
                )
            }
            
        }
}

struct WeightView_Previews: PreviewProvider {
    static var previews: some View {
        WeightView()
    }
}
