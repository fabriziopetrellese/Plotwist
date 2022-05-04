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
            ZeroPageView(subtitle: desc,
                         shouldShowOnboarding: $shouldShowOnboarding)
            
            FirstPageView(title: moreInfo,
                           shouldShowOnboarding: $shouldShowOnboarding)
            
            SecondPageView(title: welcome,
                          shouldShowOnboarding: $shouldShowOnboarding)
            
            ThirdPageView(title: finalInfo,
                          buttonLabel: letsgo,
                          shouldShowOnboarding: $shouldShowOnboarding)
            
            
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
}

func setupAppearance() {
    UIPageControl.appearance().currentPageIndicatorTintColor = .black
    UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
}

struct ZeroPageView: View {
    let subtitle: LocalizedStringKey
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        VStack {
            Image("logoOnb1")
                .resizable()
                .frame(width: 283, height: 178)
            
            Text(subtitle)
                .font(Font.custom("Life Savers", size: 36))
                .fontWeight(.heavy)
                .frame(height: 98)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.top)
                .padding(.horizontal)
            
            Image("diceOnb1")
                .padding(.leading, 190)
                .padding(.top, 30)
        }
        .frame(width: 1 * UIScreen.main.bounds.width, height: 0.65 * UIScreen.main.bounds.height)
    }
}

struct FirstPageView: View {
    let title: LocalizedStringKey
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        VStack{
            Text(title)
                .font(Font.custom("Life Savers", size: 40))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.bottom, 32)
                .padding(.horizontal)
            
            OminiOnboarding()
                .padding(.top, 32)
        }
        .frame(width: 1 * UIScreen.main.bounds.width, height: 1 * UIScreen.main.bounds.height)
    }
}

struct SecondPageView: View {
    let title: LocalizedStringKey
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        VStack{
            Text(title)
                .font(Font.custom("Life Savers", size: 40))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.bottom, 64)
            
            DiceOnboarding()
                .padding(.top, 64)
        }
        .frame(width: 1 * UIScreen.main.bounds.width, height: 1 * UIScreen.main.bounds.height)
    }
}



struct ThirdPageView: View {
    let title: LocalizedStringKey
    let buttonLabel: LocalizedStringKey
    @Binding var shouldShowOnboarding: Bool
    
    var body: some View {
        VStack{
            Text(title)
                .font(Font.custom("Life Savers", size: 40))
                .fontWeight(.heavy)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.horizontal)
                .frame(width: 1 * UIScreen.main.bounds.width, height: 0.55 * UIScreen.main.bounds.height)
            
            Spacer()
            
            
            Button {
                shouldShowOnboarding.toggle()
            } label: {
                ZStack {
                    ButtonsModel(label: buttonLabel)
                    
                    Image("omionb4")
                        .padding(.bottom, 156)
                        .padding(.leading, 128)
                }
            }
            
            .frame(width: 1 * UIScreen.main.bounds.width, height: 0.25 * UIScreen.main.bounds.height)

        }
    }
}

//struct OnboardingView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        OnboardingView(shouldShowOnboarding: .constant(false))
//
//    }
//}


struct SecondPageView_Previews: PreviewProvider {

    static var previews: some View {
        ZeroPageView(subtitle: "", shouldShowOnboarding: .constant(false))
        
    }
}
