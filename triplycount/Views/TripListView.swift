import SwiftUI

struct TripListView: View {
    @StateObject private var viewModel = TripViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.trips) { trip in
                VStack(alignment: .leading) {
                    Text(trip.trip_text)
                        .font(.headline)
                    Text(trip.created_date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("My Trips")
            .onAppear {
                viewModel.fetchTrips()
            }
        }
    }
}
