import SwiftUI

// MARK: - Activity Indicator View via UIKit

struct ActivityIndicatorView: UIViewRepresentable {
    @Binding var isAnimated: Bool
    let style: UIActivityIndicatorView.Style
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicator = UIActivityIndicatorView(style: style)
        return indicator
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if isAnimated {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
