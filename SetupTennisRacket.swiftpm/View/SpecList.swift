//
//  SpecList.swift
//  SetupTennisRacket
//
//  Created by 강우원 on 2023/04/12.
//

import SwiftUI

struct SpecList: View {
    var contentSource: [Spec]

    @State private var selection: Destination?
    //@AppStorage("showOnboarding") var showOnboarding: Bool = true
    @State var showOnboarding: Bool = true
    
    var body: some View {
        NavigationView {
            List(selection: $selection) {
                ForEach(contentSource) { row in
                    NavigationLink(destination: Destination.view(forSelection: row.destination)) {
                        SpecRowView(title: row.title, description: row.description, systemIcon: row.systemSymbol)
                    }
                    .tag(row.destination)
                }
            }
            .navigationTitle("Racket Specs")
            .navigationBarTitleDisplayMode(.large)
            VStack{
                Image("main_racket")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
            }
            
        }
        .fullScreenCover(isPresented: $showOnboarding, content: {
            OnboardingView(showOnboarding: $showOnboarding)
        })
    }
}

struct OnboardingView: View {
    @Binding var showOnboarding: Bool
    var body: some View {
        TabView() {
            OnboardView(
                systemImageName: "🎾", title: "Welcome", description: "Get an in-depth look at Tennis Racket",
                showsDismissButton: false,
                showOnboarding: $showOnboarding
                
            )
            OnboardView(
                systemImageName: "platter.2.filled.ipad.landscape", title: "Landscape", description: "First of all, This app recommends landscape mode.",
                showsDismissButton: false,
                showOnboarding: $showOnboarding
            )
            
            OnboardView(
                systemImageName: "racket", title: "Wow 😮", description: "A tennis racket has quite a few detailed characteristics.",
                showsDismissButton: false,
                showOnboarding: $showOnboarding
            )
            
            OnboardView(
                systemImageName: "sidebar.left", title: "Let's take a quick look at!", description: "Open the left sidebar and choose!",
                showsDismissButton: true,
                showOnboarding: $showOnboarding
            )
            
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        
        
    }
}


struct OnboardView: View {
    let systemImageName: String
    let title: String
    let description: String
    let showsDismissButton: Bool
    @Binding var showOnboarding: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemImageName)
                .resizable()
                .scaledToFit()
                .frame(width: 180)
            Text(title)
                .font(.title)
                .bold()
            Text(description)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
            if showsDismissButton {
                Button {
                    showOnboarding.toggle()
                } label: {
                    Text("Get Started")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(.green)
                        .cornerRadius(6)
                }
            }
        }
        .padding(.horizontal, 20)
    }
}



struct SpecList_Previews: PreviewProvider {
    static var previews: some View {
        SpecList(contentSource: SpecData.homeContent)
        
    }
}
