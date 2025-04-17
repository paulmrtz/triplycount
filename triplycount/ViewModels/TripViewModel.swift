import Foundation

class TripViewModel: ObservableObject {
    struct TripResponse: Codable {
        let results: [Trip]
    }
    
    @Published var trips: [Trip] = []

    func fetchTrips() {
        guard let url = URL(string: "http://localhost:8000/triplycount/api/trips/") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        // 🔐 Basic Auth
        let username = "triplyadmin"
        let password = "admin"
        let loginString = "\(username):\(password)"
        guard let loginData = loginString.data(using: .utf8) else { return }
        let base64LoginString = loginData.base64EncodedString()
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")

        // 🛰️ Make the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error:", error)
                return
            }

            guard let data = data else {
                print("No data returned")
                return
            }

            do {
                let decoded = try JSONDecoder().decode(TripResponse.self, from: data)
                DispatchQueue.main.async {
                    self.trips = decoded.results
                }
            } catch {
                print("Decoding error:", error)
            }
        }.resume()
    }
}
