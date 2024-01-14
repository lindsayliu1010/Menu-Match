import Foundation

//again this should be its own file but i don't want to cause problems
class PreferenceStore: ObservableObject {
    @Published var preferences: [Preference] = Preference.previewData // our starting state
    
    func createPreference(_ preference: Preference) {
      preferences.append(preference)
    }
    
    func updatePreference(_ preference: Preference) {
      if let index = preferences.firstIndex(where: { $0.id == preference.id }) {
          preferences[index] = preference
      }
    }
    
    func deletePreference(_ preference: Preference) {
      if let index = preferences.firstIndex(where: { $0.id == preference.id }) {
          preferences.remove(at: index)
      }
    }
}
