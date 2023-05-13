//
//  SpecRowView.swift
//  SetupTennisRacket
//
//  Created by 강우원 on 2023/04/12.
//

import SwiftUI

struct SpecRowView: View {
    var title : String
    var description: String
    var systemIcon : String
    
    var body: some View {
        HStack {
            Image(systemName: systemIcon)
                .font(.title2)
                .foregroundColor(.accentColor)
                .frame(minWidth: 30, minHeight: 20)
                .padding(.trailing, 4)
            VStack(alignment: .leading, spacing: 0) {
                Text(title)
                    .font(Font.system(size: 20.0, weight: .semibold, design: .default))
                    .padding(.bottom, 4)
                Text(description)
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
        .frame(minHeight: 60)
    }
}

struct SpecRowView_Previews: PreviewProvider {
    static var previews: some View {
        SpecRowView(title: "Animations", description: "Discover how to use animations to move shapes around the scene", systemIcon: "circle.fill")
    }
}
