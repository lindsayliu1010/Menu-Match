import SwiftUI

struct PreferencesForm: View {
    @Binding var data: Preference.FormData

    var body: some View {
        Form {
            TextFieldWithLabel(label: "Radius", text: $data.radius, prompt: "Enter a Radius")
            TextFieldWithLabel(label: "Price", text: $data.price, prompt: "Enter a Price in USD")
            TextFieldWithLabel(label: "Rating", text: $data.rating, prompt: "Enter a Number of Stars, 1-5")
            
            if Double(data.rating) != nil {
                if Double(data.rating)! <= 5 {
                    if Double(data.rating)! >= 1 {
                        StarDisplay(rating: Double(data.rating)!)
                    }
                }
            }
            else {
                StarDisplay(rating: 1)
            }

          
        }
    }
}


struct TextFieldWithLabel: View {
  let label: String
  @Binding var text: String
  var prompt: String? = nil

  var body: some View {
    VStack(alignment: .leading) {
      Text(label)
        .bold()
        .font(.caption)
      TextField(label, text: $text, prompt: prompt != nil ? Text(prompt!) : nil)
        .padding(.bottom, 20)
    }
  }
}


struct PreferencesForm_Previews: PreviewProvider {
    static var previews: some View {
        PreferencesForm(data: Binding.constant(Preference.previewData[0].dataForForm))
    }
}
