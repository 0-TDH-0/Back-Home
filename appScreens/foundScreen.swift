//
//  settingsScreen.swift
//  Back Home
//
//  Created by Tommy Hale on 1/6/24.
//

import PhotosUI
import SwiftUI
import MapKit

struct Found: View {
    
    
    @Environment(\.dismiss) var dismiss
    
    @State private var isSubmitted: Bool = false
    @State private var submitFail: Bool = false
    @State private var checkAnimate: Bool = false
    
    @ObservedObject private var newFoundObject: FoundObjectEntry = FoundObjectEntry()
    
    func didDismiss(){
        
        newFoundObject.imageItem = nil
        newFoundObject.image = nil
        
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
                
                Spacer(minLength: 40)
                
                    VStack{
                        /*
                         Maybe implement a map later? may be extraneous
                         Map{}
                         .frame(width: 250, height: 250)
                         .mapControlVisibility(.visible)
                         */
                        HStack{
                            
                            PhotosPicker("Select Image", selection: $newFoundObject.imageItem, matching: .images)
                                .padding(.leading)
                                .foregroundStyle(.white)
                            
                            Spacer()
                            
                            newFoundObject.image?
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                            
                            Spacer()
                            
                        }
                        .onChange(of: newFoundObject.imageItem) {
                            Task {
                                if let loaded = try? await newFoundObject.imageItem?.loadTransferable(type: Image.self){
                                    newFoundObject.image = loaded
                                }
                                else {
                                    print("failed")
                                }
                            }
                        }
                        
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
                                    
                                    Button{
                                        isSubmitted.toggle()
                                    }label: {
                                        ButtonModel(buttonText: "Okay",
                                                    buttonColor: .white,
                                                    buttonBack: .black)
                                    }
                                    
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
                                    
                                    Button{
                                        submitFail.toggle()
                                    }label: {
                                        ButtonModel(buttonText: "Dismiss",
                                                    buttonColor: .white,
                                                    buttonBack: .black)
                                    }
                                    
                                    Spacer()
                                    
                                }
                            }
                        }
    
                        
                        Spacer()
                        
                        
                        
                    }
                    Spacer()
            }
        }
        .onAppear(){
            newFoundObject.imageItem = nil
            newFoundObject.image = nil
            
            newFoundObject.foundAt = ""
            newFoundObject.description = ""
            newFoundObject.title = ""
            newFoundObject.leftAt = ""
            newFoundObject.associatedName = ""
        }
    }
    
}
