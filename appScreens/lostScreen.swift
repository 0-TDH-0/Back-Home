//
//  settingsScreen.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation
import SwiftUI
import MapKit

struct Lost: View {

    @Environment(\.dismiss) var dismiss
    @State private var isSubmitted: Bool = false
    @State private var submitFail: Bool = false
    @State private var checkAnimate: Bool = false
    @ObservedObject private var newFoundObject: LostObjectEntry = LostObjectEntry()
    
    func didDismiss(){
        newFoundObject.lostAt = ""
        newFoundObject.description = ""
        newFoundObject.title = ""
        
        dismiss()
    }
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                
                Text("We'll Help you Find it.\nFirst, we Need a Few Details")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.top, 100)
                
                Spacer(minLength: 200)
                
                    VStack{
                        /*
                         Maybe implement a map later? may be extraneous
                         Map{}
                         .frame(width: 250, height: 250)
                         .mapControlVisibility(.visible)
                         */
                        HStack{
                            Text("Title:")
                                .frame(width: 90)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                            TextField("Give the Item a Title.", text: $newFoundObject.title, axis: .vertical)
                                .frame(width: 250)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                        }
                        HStack{
                            Text("Description:")
                                .frame(width: 90)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                            TextField("Please be as Descriptive as Possible.", text: $newFoundObject.description, axis: .vertical)
                                .lineLimit(5, reservesSpace: true)
                                .frame(width: 250)
                                .textFieldStyle(.roundedBorder)
                                Spacer()
                        }
                        HStack{
                            Text("Lost At:")
                                .frame(width: 90)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                            TextField("Where did you Lose it?", text: $newFoundObject.lostAt, axis: .vertical)
                                .lineLimit(2, reservesSpace: true)
                                .frame(width: 250)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                        }
                        Spacer()
                        
                        Button{
                            submit() ? isSubmitted.toggle(): submitFail.toggle()
                        }
                        label: {
                            ButtonModel(buttonText: "Submit",
                                        buttonColor: .white,
                                        buttonBack: .black)
                        }
                        .sheet(isPresented: $isSubmitted, onDismiss: didDismiss) {
                            ZStack{
                                
                                LinearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .ignoresSafeArea()
                                
                                VStack{
                                    Spacer(minLength: 200)
                                    
                                    Image(systemName: "checkmark.circle")
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 250, height: 250)
                                        .symbolEffect(.bounce.down.byLayer,options: .speed(0.75) ,value: checkAnimate)
                                        .onAppear(){
                                            checkAnimate.toggle()
                                        }
                                    
                                    Spacer(minLength: 100)
                                    
                                    Text("Your Submission Has Been Sent")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundStyle(.black)
                                        .padding()
                                    
                                    Spacer()
                                }
                            }
                        }
                        .sheet(isPresented: $submitFail, onDismiss: didDismiss){
                            ZStack{
                                
                                LinearGradient(colors: [.white, .gray], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .ignoresSafeArea()
                                
                                VStack{
                                    Spacer(minLength: 200)
                                    
                                    Image(systemName: "x.circle")
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 250, height: 250)
                                        .symbolEffect(.bounce.down.byLayer,options: .speed(0.75) ,value: checkAnimate)
                                        .onAppear(){
                                            checkAnimate.toggle()
                                        }
                                    
                                    Spacer(minLength: 100)
                                    
                                    Text("Your Submission Failed, try Again")
                                        .font(.system(size: 20, weight: .bold))
                                        .foregroundStyle(.black)
                                        .padding()
                                    
                                    Spacer()

                                }
                            }
                        }
                        
                        Spacer()
                        
                        
                        
                    }
                    Spacer()
            }
        }
    }
    
}
