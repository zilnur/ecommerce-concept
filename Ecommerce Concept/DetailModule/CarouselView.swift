import SwiftUI

struct CarouselView: View {
    
    @GestureState private var dragState = DragState.inactive
    @State var carouselLocation = 0
    let width = UIScreen.main.bounds.width - 148
    var itemHeight:CGFloat
    var views:[AnyView]
    
    
    private func onDragEnded(drag: DragGesture.Value) {
        let dragThreshold:CGFloat = 200
        if drag.predictedEndTranslation.width > dragThreshold || drag.translation.width > dragThreshold{
            carouselLocation =  carouselLocation - 1
        } else if (drag.predictedEndTranslation.width) < (-1 * dragThreshold) || (drag.translation.width) < (-1 * dragThreshold)
        {
            carouselLocation =  carouselLocation + 1
        }
    }
    
    
    
    var body: some View {
        ZStack{
            VStack{
                
                ZStack{
                    ForEach(0..<views.count){i in
                        VStack{
                            self.views[i]
                                .frame(width: width, height: self.getHeight(i))
                                .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 3)
                            
                            
                                .opacity(self.getOpacity(i))
                                .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                                .offset(x: self.getOffset(i))
                                .animation(.interpolatingSpring(stiffness: 300.0, damping: 30.0, initialVelocity: 10.0))
                            //                            Spacer()
                        }
                    }
                    
                }.gesture(
                    
                    DragGesture()
                        .updating($dragState) { drag, state, transaction in
                            state = .dragging(translation: drag.translation)
                        }
                        .onEnded(onDragEnded)
                )
            }
        }
    }
    
    func relativeLoc() -> Int{
        return ((views.count) + carouselLocation) % views.count
    }
    
    func getHeight(_ i:Int) -> CGFloat{
        if i == relativeLoc(){
            return itemHeight
        } else {
            return itemHeight - 100
        }
    }
    
    
    func getOpacity(_ i:Int) -> Double{
        
        if i == relativeLoc()
            || i + 1 == relativeLoc()
            || i - 1 == relativeLoc()
            || i + 2 == relativeLoc()
            || i - 2 == relativeLoc()
            || (i + 1) - views.count == relativeLoc()
            || (i - 1) + views.count == relativeLoc()
            || (i + 2) - views.count == relativeLoc()
            || (i - 2) + views.count == relativeLoc()
        {
            return 1
        } else {
            return 0
        }
    }
    
    func getOffset(_ i:Int) -> CGFloat{
        
        //This sets up the central offset
        if (i) == relativeLoc()
        {
            //Set offset of cental
            return self.dragState.translation.width
        }
        //These set up the offset +/- 1
        else if
            (i) == relativeLoc() + 1
                ||
                (relativeLoc() == views.count - 1 && i == 0)
        {
            //Set offset +1
            return self.dragState.translation.width + (250 + 20)
        }
        else if
            (i) == relativeLoc() - 1
                ||
                (relativeLoc() == 0 && (i) == views.count - 1)
        {
            //Set offset -1
            return self.dragState.translation.width - (250 + 20)
        }
        //These set up the offset +/- 2
        else if
            (i) == relativeLoc() + 2
                ||
                (relativeLoc() == views.count-1 && i == 1)
                ||
                (relativeLoc() == views.count-2 && i == 0)
        {
            return self.dragState.translation.width + (2*(300 + 20))
        }
        else if
            (i) == relativeLoc() - 2
                ||
                (relativeLoc() == 1 && i == views.count-1)
                ||
                (relativeLoc() == 0 && i == views.count-2)
        {
            //Set offset -2
            return self.dragState.translation.width - (2*(300 + 20))
        }
        //These set up the offset +/- 3
        else if
            (i) == relativeLoc() + 3
                ||
                (relativeLoc() == views.count-1 && i == 2)
                ||
                (relativeLoc() == views.count-2 && i == 1)
                ||
                (relativeLoc() == views.count-3 && i == 0)
        {
            return self.dragState.translation.width + (3*(300 + 20))
        }
        else if
            (i) == relativeLoc() - 3
                ||
                (relativeLoc() == 2 && i == views.count-1)
                ||
                (relativeLoc() == 1 && i == views.count-2)
                ||
                (relativeLoc() == 0 && i == views.count-3)
        {
            //Set offset -2
            return self.dragState.translation.width - (3*(300 + 20))
        }
        //This is the remainder
        else {
            return 10000
        }
    }
    
    
}





enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView(itemHeight: 349, views: [AnyView(AsyncImage(url: URL(string: "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig"), content: { image in
            image
                .resizable()
                .scaledToFit()
        }, placeholder: {})),AnyView(AsyncImage(url: URL(string: "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg"), content: { image in
            image
                .resizable()
                .scaledToFit()
        }, placeholder: {}))
                                             ])
    }
}

