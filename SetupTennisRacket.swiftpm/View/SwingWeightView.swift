//
//  SwiftUIView.swift
//  
//
//  Created by 강우원 on 2023/04/18.
//

import SwiftUI
// TODO:
// 스윙웨이트 머신으로 휙휙 돌린 후
// low middle high에 맞는 값, 내용을 보여주기



struct SwingWeightView: View {
    @State private var isAnimating = false
    @State private var swingWeight = 320.0
    @State private var degrees = 0.0
    
    
    var body: some View {
        HStack{
            Spacer()
            VStack{
                VStack {
                    HStack{
                        Text("Low")
                        Slider(value: $swingWeight, in: 280...400, step: 1)
                            .padding()
                            .frame(width: 300)
                        Text("High")
                    }
                    
                    Text("\(Int(swingWeight))")
                        .font(.system(size: 40))
                        .padding()
                    Image("racket")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .rotationEffect(.degrees(degrees), anchor: UnitPoint(x: 0.5, y: 1.0))
                        .padding()
                    Button {
                        let dampingFraction = max(0.3, 1 - (swingWeight - 280) / 120) // calculate dampingFraction based on swingWeight
                        let response = min(1.0, 0.5 + (swingWeight - 280) / 240) // calculate response based on swingWeight
                        withAnimation(.spring(response: response, dampingFraction: dampingFraction)) {
                            self.degrees = self.degrees == 0 ? -60 : 0
                        }
                    } label: {
                        Text("Rotate")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .padding()

                }
            }
            Spacer()
            // 310 / 310-330 / 330
            VStack {
                // 오른쪽 설명 뷰
                VStack(alignment: .leading) {
                    Text(swingWeight <= 310 ? "Low Swing Weight" : (swingWeight >= 330 ? "High Swing Weight" : "Medium Swing Weight"))
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(swingWeight <= 310 ? "Easier to swing, but less stability" : (swingWeight >= 330 ? "It is very stable, but requires strength." :"Medium maneuverability and stability"))
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .padding(.bottom)
                    Text(swingWeight <= 310 ? "They offer less stability and comfort, especially when playing aganst higher levels of pace." : (swingWeight >= 330 ? "They are better suited for advanced and stronger players. And offer more comfort, power and stability at impact." :"They provide a nice balance between power and control, and offer decent maneuverability."))
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
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.white, Color.blue, Color.purple]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .opacity(min(1, (swingWeight - 250) / 120))
        )
        
    }
    
}



struct SwingWeightView_Previews: PreviewProvider {
    static var previews: some View {
        SwingWeightView()
    }
}
