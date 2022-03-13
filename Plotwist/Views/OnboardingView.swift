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
    let letsgo: LocalizedStringKey = "letsgo"
    
    var body: some View {
        TabView {
            FirstPageView(title: welcome, subtitle: desc, image: "plotwistVector", shouldShowOnboarding: $shouldShowOnboarding)
            
            SecondPageView(title: moreInfo, image: "omini_onboarding", shouldShowOnboarding: $shouldShowOnboarding)
            
            ThirdPageView(title: finalInfo, buttonLabel: letsgo, showsDismissButton: true, shouldShowOnboarding: $shouldShowOnboarding)
            
            
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
                .font(Font.custom("Life Savers", size: 40))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width: 280)
                .padding(24)

            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 164.94, height: 119)
                .padding(24)
            
            Text(subtitle)
                .font(Font.custom("Life Savers", size: 38))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width: 280)
                .padding(24)
        }
        .padding(.bottom, 288)
    }
}

struct SecondPageView: View {
    let title: LocalizedStringKey
    let image: String
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        VStack{
            Text(title)
                .font(Font.custom("Life Savers", size: 40))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width: 280)
                .padding(48)
            
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 249.55, height: 153.99)
                .padding(48)
        }
        .padding(.bottom, 288)
    }
}

struct ThirdPageView: View {
    let title: LocalizedStringKey
    let buttonLabel: LocalizedStringKey
    let showsDismissButton: Bool
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        VStack{
            Text(title)
                .font(Font.custom("Life Savers", size: 40))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(width: 320, height: 380)
                .padding(128)
            
            
            if showsDismissButton {
                Button {
                    shouldShowOnboarding.toggle()
                } label: {
                    ButtonsModel(label: buttonLabel)
                }
                .padding(160)
            } else {
                ZStack {
                    
                }
                .padding(160)
            }
             
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(shouldShowOnboarding: .constant(true))
    }
}
