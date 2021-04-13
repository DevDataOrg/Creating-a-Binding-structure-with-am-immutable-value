
import SwiftUI

struct ContentView: View {
   @State private var title: String = "Default Title"
   @State private var titleInput: String = ""

   var body: some View {
      VStack {
         HeaderView(title: $title)
         TextField("Insert Title", text: $titleInput)
            .textFieldStyle(RoundedBorderTextFieldStyle())
         Button(action: {
            self.title = self.titleInput
            self.titleInput = ""
         }, label: { Text("Change Title") })
         Spacer()
      }.padding()
   }
}
struct HeaderView: View {
   @Binding var title: String
   var counter: Int = 0

   init(title: Binding<String>) {
      self._title = title
        
      let sentence = self._title.wrappedValue
      counter = sentence.count
   }
   var body: some View {
      Text("\(title) (\(counter))")
         .padding(10)
   }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct HeaderView_Previews: PreviewProvider {
   static var previews: some View {
      HeaderView(title: .constant("My Preview Title"))
   }
}
