import SwiftUI

struct DateForm: View {
    @Binding var data: Restaurant.FormData

    var body: some View {
        Form {
            Toggle("Previously Visited", isOn: $data.previouslyPrepared)
            if data.previouslyPrepared {
            DatePicker("Last Visited", selection: $data.lastPreparedAt)
            }
            
          
        }
    }
}

struct DateForm_Previews: PreviewProvider {
    static var previews: some View {
        DateForm(data:
                    Binding.constant(Restaurant.previewData[0].dataForForm))
    }
}
