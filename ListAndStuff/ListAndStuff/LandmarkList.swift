/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 A view showing a list of landmarks.
 */

import SwiftUI

struct LandmarkList: View {
    @State private var landmark = landmarkData
    
    var body: some View {
        NavigationView {
            List{
                ForEach(landmark) {landmark in
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landmark: landmark)
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
        landmark.remove(atOffsets: offsets)
    }
    func move(from source: IndexSet, to destination: Int) {
        landmark.move(fromOffsets: source, toOffset: destination)
    }
}


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
        
    }
}
