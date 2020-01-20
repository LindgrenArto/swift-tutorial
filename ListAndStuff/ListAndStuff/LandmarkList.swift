/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view showing a list of landmarks.
 */

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData
    
    @State var showFavoritesOnly = false
    
    var body: some View {
        NavigationView {
            List{
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Show Favorites Only")
                }
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark)
                                .environmentObject(self.userData)
                        ) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .navigationBarTitle(Text ("Landmarks"))
            .navigationBarItems(trailing: EditButton())
        }
        
    }
    func delete(at offsets: IndexSet) {
        userData.landmarks.remove(atOffsets: offsets)
    }
    func move(from source: IndexSet, to destination: Int) {
        userData.landmarks.move(fromOffsets: source, toOffset: destination)
    }
}


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(UserData())
        
    }
}
