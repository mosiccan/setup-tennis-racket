//
//  SwiftUIView.swift
//  
//
//  Created by 강우원 on 2023/04/15.
//

import SwiftUI

struct BalanceView: View {
    @State private var position: CGSize = .zero
    @State private var balance: Double = 0.0
    
    var body: some View {
        HStack {
            ZStack{
                VStack {
                    if balance > 1 {
                        Text("Head Heavy")
                            .offset(y:-320)
                            .opacity(0.5)
                            .font(.system(size: 120, weight: .heavy))
                    } else if (balance > -1) && (balance < 1) {
                        Text("Even Balance")
                            .offset(y: 0)
                            .opacity(0.5)
                            .font(.system(size: 120, weight: .regular))
                    } else {
                        Text("Head   Light")
                            .offset(y:280)
                            .opacity(0.5)
                            .font(.system(size: 120, weight: .light))
                    }
                }
                
                Image("racket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                VStack{
                    Text("\(abs(Int(balance)))pt")
                        .offset(y: -210)
                        .font(.title)
                    Text(balance < -1 ? "Head Light" : (balance > 1 ? "Head Heavy" : "Even Balance"))
                        .offset(y: -180)
                        .font(.title)
                }
                
                RoundedRectangle(cornerRadius: 0)  // dash
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                    .foregroundColor(.red)
                    .frame(width: 300, height: 200)
                ZStack {
                    Circle()
                        .frame(width: 20)
                        .foregroundColor(.red)
                    Rectangle()
                        .frame(height: 5)
                        .foregroundColor(.red)
                        .opacity(0.5)
                }
                .offset(position)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let y = value.translation.height
                            position = CGSize(width: 0, height: min(max(y-2, -100), 100))
                            balance = -Double(position.height) / 10.0
                        }
                        .onEnded { value in
                            let y = value.translation.height
                            position = CGSize(width: 0, height: min(max(y-2, -100), 100))
                            balance = -Double(position.height) / 10.0
                        }
                )
                
            }
            VStack {
                // 오른쪽 설명 뷰
                VStack(alignment: .leading) {
                    Text(balance < -1 ? "Head Light" : (balance > 1 ? "Head Heavy" : "Even Balance"))
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(balance < -1 ? "High Control and Maneuverability" : (balance > 1 ? "High Power Low Control" :"Medium Speed and Average shot Control"))
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .padding(.bottom)
                    Text(balance < -1 ? "The racquet’s weight is greater toward the handle and is a common balance among heavier tennis racquets, which helps players maneuver them. " : (balance > 1 ? "As a player swings a head heavy racquet and makes contact with a tennis ball, the extra weight helps provide a greater force on contact." :"Midweight tennis racquets tend to be closer to equal balance because the weight class doesn’t require distribution toward the head or handle for the racquet to perform."))
                    Spacer()
                }
                .frame(width: 400)
                
            }
            .padding()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 2)
            )
            
        }
        .background(Color(.sRGB, red: 0, green: 1, blue: 0, opacity: max(balance/10, 0.1)))
        
    }
}







struct BalanceView_Previews: PreviewProvider {
    static var previews: some View {
        BalanceView()
    }
}
