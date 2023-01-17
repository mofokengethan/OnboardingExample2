//
//  ContentView.swift
//  OnboardingExample2
//
//  Created by Ethan Mofokeng on 12/18/22.
//  Design Credit: https://dribbble.com/shots/18336774-Mobile-Onboarding-Dark-Mode
//

import SwiftUI

// MARK: FIRST ONBOARDING STEP
struct OnboardingViewOne: View {
    @Binding var onboardingOne: Bool
    @Binding var onboardingTwo: Bool
    @Binding var onboardingThree: Bool
    var body: some View {
    ZStack {
        Color.eerieBlack
        VStack {
            Image("1")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Get food delivery to your doorstep asap")
                .fontWeight(.heavy)
                .font(.title)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
            Text("We have young professional delivery team that will bring your food as soon as possible to your doorstep")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            ProgressBar(
                onboardingOne: $onboardingOne,
                onboardingTwo: $onboardingTwo,
                onboardingThree: $onboardingThree)
        }
        .padding(.bottom, 40)
    }
}}

// MARK: SECOND ONBOARDING STEP
struct OnboardingViewTwo: View {
    @Binding var onboardingOne: Bool
    @Binding var onboardingTwo: Bool
    @Binding var onboardingThree: Bool
    var body: some View {
    ZStack {
        Color.eerieBlack
        VStack {
            Image("2")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Buy Any Food from your favorite restaurant")
                .fontWeight(.heavy)
                .font(.title)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
            Text("We are constantly adding your favorite restaurant throughout the territory and around your area carefully selected")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            ProgressBar(
                onboardingOne: $onboardingOne,
                onboardingTwo: $onboardingTwo,
                onboardingThree: $onboardingThree)
        }
        .padding(.bottom, 40)
    }
}}

// MARK: LAST ONBOARDING STEP
struct OnboardingViewThree: View {
    @Binding var onboardingOne: Bool
    @Binding var onboardingTwo: Bool
    @Binding var onboardingThree: Bool
    var body: some View {
    ZStack {
        Color.eerieBlack
        VStack {
            Image("3")
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text("Get exclusive offer from your favorite restaurant")
                .fontWeight(.heavy)
                .font(.title)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()
            Text("We are constaly bringing your favorite food from your favorite restaurant with various types of order")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            ProgressBar(
                onboardingOne: $onboardingOne,
                onboardingTwo: $onboardingTwo,
                onboardingThree: $onboardingThree)
        }
        .padding(.bottom, 40)
    }
}}

// MARK: PROGRESS BAR
struct ProgressBar: View {
    @Binding var onboardingOne: Bool
    @Binding var onboardingTwo: Bool
    @Binding var onboardingThree: Bool
    var body: some View {
        HStack {
            ProgressIndicator(selected: onboardingOne)
            ProgressIndicator(selected: onboardingTwo)
            ProgressIndicator(selected: onboardingThree)
        }
        .padding()
    }
}

struct ContentView: View {
    @State var onboardingOne = true
    @State var onboardingTwo = false
    @State var onboardingThree = false
    var body: some View {
        ZStack {
            Color.eerieBlack.ignoresSafeArea()
                .ignoresSafeArea()
            TabView {
               
                // MARK: ONBOARDING VIEW ONE
                OnboardingViewOne(
                    onboardingOne: $onboardingOne,
                    onboardingTwo: $onboardingTwo,
                    onboardingThree: $onboardingThree)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        onboardingOne = true
                        onboardingTwo = false
                        onboardingThree = false
                    }
                }
                
                // MARK: ONBOARDING VIEW TWO
                OnboardingViewTwo(
                    onboardingOne: $onboardingOne,
                    onboardingTwo: $onboardingTwo,
                    onboardingThree: $onboardingThree)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        onboardingOne = false
                        onboardingTwo = true
                        onboardingThree = false
                    }
                }
                
                // MARK: ONBOARDING VIEW THREE
                OnboardingViewThree(
                    onboardingOne: $onboardingOne,
                    onboardingTwo: $onboardingTwo,
                    onboardingThree: $onboardingThree)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        onboardingOne = false
                        onboardingTwo = false
                        onboardingThree = true
                    }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .padding()
            
            // MARK: ONBOARDING NAVIGATION
            OnboardingNavigation(getStartedAction: {
                // MARK: NAVIGATE TO GET STARTED VIEW
        
            }, signUpAction: {
                // MARK: NAVIGATE TO SIGN UP VIEW
                
            })
        }
    }
}

// MARK: ONBOARDING NAVIGATION VIEW BUTTONS
struct OnboardingNavigation: View {
    let getStartedAction: () -> Void
    let signUpAction: () -> Void
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: { getStartedAction() }, label: {
                    Text("Skip")
                })
                .buttonStyle(ButtonStyleTwo())
            }
            Spacer()
            Button(action: { signUpAction() }, label: {
                Text("Get Started")
            })
            .buttonStyle(ButtonStyleOne())
            HStack {
                Text("Don't have an account?")
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                Text("Sign Up")
                    .foregroundColor(.verdigris)
            }
            .padding(10)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// MARK: PROGRESS BAR INDICATOR
struct ProgressIndicator: View {
    var selected: Bool
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .frame(
                width: selected ? UIScreen.main.bounds.width / 8 : UIScreen.main.bounds.width / 18,
                height: 10
            )
            .padding(.horizontal, 2)
            .foregroundColor(selected ? .goldCrayola : .jet)
    }
}

// MARK: COOLORS.CO COLOR EXTENSION
extension Color {
    static let jet = Color(red: 55/255, green: 55/255, blue: 55/255)
    static let goldCrayola = Color(red: 231/255, green: 189/255, blue: 128/255)
    static let eerieBlack = Color(red: 33/255, green: 33/255, blue: 33/255)
    static let verdigris = Color(red: 81/255, green: 175/255, blue: 171/255)
}

// MARK: BUTTON STYLE
struct ButtonStyleOne: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.verdigris.cornerRadius(8))
    }
}

// MARK: BUTTON STYLE
struct ButtonStyleTwo: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal, 10)
            .background(Color.goldCrayola.cornerRadius(40))
    }
}
