//
//  OnboardingView.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 07/03/22.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        TabView {
            PageView(title: "First page", subtitle: "Benvenuto nell'app", image: "house", showsDismissButton: false, shouldShowOnboarding: $shouldShowOnboarding)

            PageView(title: "Second page", subtitle: "Gioco di storie", image: "dice", showsDismissButton: false, shouldShowOnboarding: $shouldShowOnboarding)
            
            PageView(title: "Third page", subtitle: "Incomincia a giocare!", image: "airplane", showsDismissButton: true, shouldShowOnboarding: $shouldShowOnboarding)
        }
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            setupAppearance()
        }
        .background(
            Image("BACK")
                .ignoresSafeArea()
        )
    }
    
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
    }
}

struct PageView: View {
    let title: String
    let subtitle: String
    let image: String
    let showsDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        VStack{
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()
            
            Text(title)
                .font(Font.custom("Quick Pencil", size: 30))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(subtitle)
                .font(Font.custom("Quick Pencil", size: 29))
                .foregroundColor(.darkGray)
                .multilineTextAlignment(.center)
                .padding()
            
            if showsDismissButton {
                Button {
                    shouldShowOnboarding.toggle()
                } label: {
                    Text("Let's go")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(.green)
                        .cornerRadius(6)
                }
                .padding()
            }
        }
    }
}
