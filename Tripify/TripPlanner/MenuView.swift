//
//  MenuView.swift
//  TripPlanner
//
//  Created by ndpate11 on 4/13/23.
//

import Foundation
import SwiftUI

struct MenuView: View{
    
    
    
    var body: some View{
       
        NavigationView{
        GeometryReader { geometry in
        ZStack(alignment: .top){
        Image("Logo")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: geometry.size.width, height: geometry.size.height / 4)
            .clipped()
            
        }
        .ignoresSafeArea(edges: .top)
            VStack(alignment: .center, spacing: 30) {
                Button(action: {}) {
				Spacer()
                               Text("Create Trip")
                                   .foregroundColor(.white)
                           }
                           .frame(width: 300, height: 15)
                           .padding()
                           .background(Color.teal)
                           .cornerRadius(30)
                           
                      
                           
                           Button(action: {}) {
                               Text("Remove Trip")
                                   .foregroundColor(.white)
                           }
                           .frame(width: 300, height: 15)
                           .padding()
                           .background(Color.teal)
                           .cornerRadius(30)
                           
                       
                           
                           Button(action: {}) {
                               Text("Edit Trip")
                                   .foregroundColor(.white)
                           }
                           .frame(width: 300, height: 15)
                           .padding()
                           .background(Color.teal)
                           .cornerRadius(30)
                           
                         
                           
                           Button(action: {}) {
                               Text("View Trip")
                                   .foregroundColor(.white)
                           }
                           .frame(width: 300, height: 15)
                           .padding()
                           .background(Color.teal)
                           .cornerRadius(30)
                    
                           
                           Button(action: {}) {
                               Text("Add Flight")
                                   .foregroundColor(.white)
                           }
                           .frame(width: 300, height: 15)
                           .padding()
                           .background(Color.teal)
                           .cornerRadius(30)
                           
                  
                           
                           Button(action: {}) {
                               Text("Add Accommodation")
                                   .foregroundColor(.white)
                           }
                           .frame(width: 300, height: 15)
                           .padding()
                           .background(Color.teal)
                           .cornerRadius(30)
                           
                           
                           Button(action: {}) {
                               Text("Weather Updates")
                                   .foregroundColor(.white)
                           }
                           .frame(width: 300, height: 15)
                           .padding()
                           .background(Color.teal)
                           .cornerRadius(30)
                           
                          
                           
                           Button(action: {}) {
                               Text("Get Recommendations")
                                   .foregroundColor(.white)
                           }
                           .frame(width: 300, height: 15)
                           .padding()
                           .background(Color.teal)
                           .cornerRadius(30)
                           Spacer()
                          
                       }
                       .frame(maxWidth: .infinity, alignment: .center)
                   }
            
        }
    }
}
