//
//  NextTurn.swift
//  Rebooters_v1
//
//  Created by Valerio Domenico Conte on 16/02/22.
//

import SwiftUI

struct NextTurn: View {
    @EnvironmentObject var playersModel: PlayersModel
    @EnvironmentObject var incipitsModel: IncipitsModel
    @EnvironmentObject var storiesModel: StoriesModel
    @EnvironmentObject var navigationRoot: NavigationRoot
    
    let button3: LocalizedStringKey = "button3"
    let firstPart: LocalizedStringKey = "firstPart"
    let secondPart: LocalizedStringKey = "secondPart"
    let thirdPart: LocalizedStringKey = "thirdPart"
    let fourthPart: LocalizedStringKey = "fourthPart"
    

    
    
    var body: some View {
        VStack {
            Spacer()
            if storiesModel.turnNumber < 5 {
                let primaParte = String(format: NSLocalizedString("firstPart", comment: ""), arguments: [playersModel.activePlayer])
                let secondaParte = String(format: NSLocalizedString("secondPart", comment: ""))
                Text(primaParte + secondaParte)
                    .font(Font.custom("Life Savers", size: 41))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom)
            } else {
                let terzaParte = String(format: NSLocalizedString("thirdPart", comment: ""), arguments: [playersModel.activePlayer])
                let quartaParte = String(format: NSLocalizedString("fourthPart", comment: ""))
                Text(terzaParte + quartaParte)
                    .font(Font.custom("Life Savers", size: 43))
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.bottom)
            }
            Spacer()
            NavigationLink {
                if navigationRoot.mode1 == true {
                    Storystarters()
                }
                if navigationRoot.mode2 == true {
                    DiceStorytelling()
                }
            } label: {
                ZStack {
                    ButtonsModel(label: button3)
                    Image("OMINO1")
                        .padding(.bottom, 96)
                        .padding(.leading, 92)
                }
            }
            .simultaneousGesture(TapGesture().onEnded{
                incipitsModel.nextIncipit()
            })
        }
        .background(
            Image("BACK")
                .ignoresSafeArea()
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct NextTurn_Previews: PreviewProvider {
    static var previews: some View {
        NextTurn()
            .environmentObject(PlayersModel())
            .environmentObject(IncipitsModel())
            .environmentObject(StoriesModel())
            .environmentObject(NavigationRoot())
    }
}
