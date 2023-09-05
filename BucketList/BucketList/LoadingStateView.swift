
import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading View")
    }
}

struct FailureView: View {
    var body: some View {
        Text("Failure View")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Success View")
    }
}

struct LoadingStateView: View {
    let loadingState = LoadingState.failure

    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .failure:
            FailureView()
        case .success:
            SuccessView()
        }
    }
}

struct LoadingStateView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingStateView()
    }
}
