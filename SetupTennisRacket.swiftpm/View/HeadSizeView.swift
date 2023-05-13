//
//  HeadSizeView.swift
//  SetupTennisRacket
//
//  Created by 강우원 on 2023/04/12.
//

import SwiftUI

struct HeadSizeView: View {
    @State private var myHeadSize: Double = 100
    @State private var canvasWidth: CGFloat = 330
    @State private var canvasHeight: CGFloat = 430

    var body: some View {
        HStack {
            Spacer()
            
            ZStack {
                Canvas { context, size in
                    context.fill(
                        Path(ellipseIn: CGRect(x: 5, y: 5, width: size.width - 10, height: size.height - 10)),
                        with: .color(.orange)
                    )
                    context.stroke(
                        Path(ellipseIn: CGRect(x: 10, y: 10, width: size.width - 20, height: size.height - 20)),
                        with: .color(.blue),
                        lineWidth: 16
                    )
                }
                .frame(width: canvasWidth, height: canvasHeight)
                Text("\(Int(myHeadSize))sq")
                    .font(.title)
                Text(myHeadSize < 97 ? "Mid Size" : myHeadSize > 104 ? "Over Sized" : "Mid-Plus Size")
                    .offset(y: -300)
                    .opacity(0.5)
                    .font(.system(size: myHeadSize < 97 ? 60 : myHeadSize > 104 ? 80 : 70, weight: myHeadSize < 97 ? .light : myHeadSize > 104 ? .heavy : .regular))

            }
            .frame(width: 500, height: 600)
            ZStack {
                VStack {
                    Text("120sq")
                        .font(.system(size: 24))
                        .bold()
                    Slider(value: $myHeadSize, in: 90...120, step: 1) {_ in
                        let ratio = CGFloat(myHeadSize - 90) / CGFloat(120 - 90)
                        canvasWidth = 315 + ratio * (350 - 315)
                        canvasHeight = 418 + ratio * (480 - 418)
                    }
                    .frame(width: 300, height: 300)
                    .rotationEffect(.degrees(-90))
                    Text("90sq")
                }
            }
            .frame(width: 200, height: 500)
            
            
            Spacer()
            VStack {
                // 오른쪽 설명 뷰
                VStack(alignment: .leading) {
                    Text(myHeadSize < 97 ? "Mid Size" : myHeadSize > 104 ? "Over Sized" :"Mid-Plus Size")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(myHeadSize < 97 ? "Low Power High Control" : myHeadSize > 104 ? "High Power Low Control" :"Medium Power and Control")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .padding(.bottom)
                    Text(myHeadSize < 97 ? "Such a surface area offers less power generated from it but more control." : myHeadSize > 104 ? "It offers more power for the ball to bounce further but with limited control.": "That offers you the best of both worlds — a balance between power and control. ")
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
    }
}



struct HeadSizeView_Previews: PreviewProvider {
    static var previews: some View {
        HeadSizeView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

