//
//  settingsScreen.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import Foundation
import SwiftUI
import MapKit

struct Found: View {
    
    
    @Environment(\.dismiss) var dismiss
    private let alertTitle: String = "Test"
    @State private var isSubmitted: Bool = false
    @ObservedObject private var newFoundObject: FoundObjectEntry = FoundObjectEntry()
    
    func didDismiss(){
        newFoundObject.foundAt = ""
        newFoundObject.description = ""
        newFoundObject.title = ""
        newFoundObject.leftAt = ""
        newFoundObject.associatedName = ""
        
        dismiss()
    }
    
    var body: some View {
        ZStack{
            LinearGradient(colors: [.gray, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack{
                
                Text("Great! Tell us What You Found")
                    .font(.system(size: 25, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.top, 100)
                
                Spacer(minLength: 100)
                
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
                            Text("Associated Name:")
                                .frame(width: 90)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                            TextField("If Applicable.", text: $newFoundObject.associatedName, axis: .vertical)
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
                            Text("Found At:")
                                .frame(width: 90)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                            TextField("Where did you Find it?", text: $newFoundObject.foundAt, axis: .vertical)
                                .lineLimit(2, reservesSpace: true)
                                .frame(width: 250)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                        }
                        HStack{
                            Text("Left At:")
                                .frame(width: 90)
                                .font(.system(size: 15, weight: .bold))
                                .foregroundStyle(.black)
                                .padding()
                            Spacer()
                            TextField("Where did you Leave it?", text: $newFoundObject.leftAt, axis: .vertical)
                                .lineLimit(2, reservesSpace: true)
                                .frame(width: 250)
                                .textFieldStyle(.roundedBorder)
                            Spacer()
                        }
                        Spacer()
                        
                        Button{
                            isSubmitted.toggle()
                        }
                        label: {
                            ButtonModel(buttonText: "Submit",
                                        buttonColor: .white,
                                        buttonBack: .black)
                        }
                        .sheet(isPresented: $isSubmitted, onDismiss: didDismiss) {
                            //TODO: when submitted
                        }
    
                        
                        Spacer()
                        
                        
                        
                    }
                    Spacer()
            }
        }
    }
    
}
