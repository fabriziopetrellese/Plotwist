//
//  OnboardingView.swift
//  Plotwist
//
//  Created by Valerio Domenico Conte on 07/03/22.
//

import SwiftUI

struct OnboardingView: View {
    @Binding var shouldShowOnboarding: Bool
    
    let welcome: LocalizedStringKey = "welcome"
    let desc: LocalizedStringKey = "desc"
    let moreInfo: LocalizedStringKey = "moreInfo"
    let finalInfo: LocalizedStringKey = "finalInfo"
    let continueButton: LocalizedStringKey = "continue"
    let letsgo: LocalizedStringKey = "letsgo"
    
    var body: some View {
        TabView {
            FirstPageView(title: welcome, subtitle: desc, image: "plotwistOnboarding", shouldShowOnboarding: $shouldShowOnboarding)
            
            PageView(title: moreInfo, buttonLabel: continueButton, showsDismissButton: false, shouldShowOnboarding: $shouldShowOnboarding)
            
            PageView(title: finalInfo, buttonLabel: letsgo, showsDismissButton: true, shouldShowOnboarding: $shouldShowOnboarding)
            
            
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

struct FirstPageView: View {
    let title: LocalizedStringKey
    let subtitle: LocalizedStringKey
    let image: String
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        VStack{
            Text(title)
                .font(Font.custom("Quick Pencil", size: 50))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width: 240)
                .padding(32)
            
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 164.94, height: 119)
                .padding(32)
            
            Text(subtitle)
                .font(Font.custom("Quick Pencil", size: 48))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width: 280)
                .padding(32)
        }
    }
}

struct PageView: View {
    let title: LocalizedStringKey
    let buttonLabel: LocalizedStringKey
    let showsDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        VStack{
            Text(title)
                .font(Font.custom("Quick Pencil", size: 50))
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width: 280)
                .padding(128)
            
            
            if showsDismissButton {
                Button {
                    shouldShowOnboarding.toggle()
                } label: {
                    ButtonsModel(label: buttonLabel)
                }
                .padding(128)
            } else {
                ZStack {
                    
                }
                .padding(192)
            }
             
        }
    }
}

//struct Onboarding_Previews: PreviewProvider {
//    static var previews: some View {
//        OnboardingView(shouldShowOnboarding: .constant(true))
//    }
//}
