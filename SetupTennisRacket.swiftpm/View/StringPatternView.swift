//
//  StringPatternView.swift
//  SetupTennisRacket
//
//  Created by 강우원 on 2023/04/12.
//

import SwiftUI

struct StringPatternView: View {
    @State var mainStringCount = 16
    @State var crossStringCount = 19
    //@State var allStringCount: Int = 0
    
    var body: some View {
        
        HStack {
            Spacer()
            VStack{
                Text(mainStringCount + crossStringCount <= 36 ? "Open Pattern" : "Dense Pattern")
                    .font(.system(size: 80, weight: .regular))
                    .opacity(0.3)

                HStack{
                    // 스트링 개수
                    VStack{
                        Text("Main Strings")
                            .font(.system(size: 48))
                            .padding()
                        
                        Button {
                            if mainStringCount < 18 {
                                mainStringCount += 1
                            }
                        } label: {
                            Image(systemName: "chevron.up.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        
                        Text("\(mainStringCount)")
                            .font(.system(size: 40))
                            .padding()
                        
                        Button {
                            if mainStringCount > 14 {
                                mainStringCount -= 1
                            }
                        } label: {
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                    }
                    VStack{
                        Text("Corss Strings")
                            .font(.system(size: 48))
                            .padding()
                        Button {
                            if crossStringCount < 20 {
                                crossStringCount += 1
                            }
                        } label: {
                            Image(systemName: "chevron.up.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                        
                        Text("\(crossStringCount)")
                            .font(.system(size: 40))
                            .padding()
                        
                        Button {
                            if crossStringCount > 15 {
                                crossStringCount -= 1
                            }
                        } label: {
                            Image(systemName: "chevron.down.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                    }
                }
            }
            
            Spacer()
            VStack {
                // 오른쪽 설명 뷰
                // TODO: open, cross 줄 개수 합이 36이하이면 open 패턴 설명을 띄우고 37개 부터는 dense패턴을 띄운다.
                VStack(alignment: .leading) {
                    Text(mainStringCount + crossStringCount <= 36 ? "Open Pattern" : "Dense Pattern")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(mainStringCount + crossStringCount <= 36 ? "More Power and Spin" : "More Control and Precision")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                        .padding(.bottom)
                    Text(mainStringCount + crossStringCount <= 36 ? "The open string pattern will dig in, grab the ball and send it out with a good amount of spin." : "These dense string patterns are great for players who hit flatter shots and don't use spin to control their shots.")
                    Spacer()
                }
                .frame(maxWidth: 400)
            }
            .padding()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB,red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
            )
            .padding(20)
            
        }
        
    }
}




struct StringPatternView_Previews: PreviewProvider {
    static var previews: some View {
        StringPatternView()
    }
}
