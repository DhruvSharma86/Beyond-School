import SwiftUI

struct WelcomeView: View {
    @State private var isShowingPrototypeInfo = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(red: 0.04, green: 0.10, blue: 0.19), Color(red: 0.08, green: 0.24, blue: 0.33)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 28) {
                    brandHeader

                    VStack(alignment: .leading, spacing: 16) {
                        Text("Planned experiences")
                            .font(.headline)
                            .foregroundStyle(.white.opacity(0.85))

                        ViewThatFits(in: .horizontal) {
                            HStack(spacing: 16) {
                                experienceCard(
                                    title: "ROADside READY",
                                    subtitle: "Emergency tyre replacement and roadside safety.",
                                    symbol: "wrench.and.screwdriver.fill",
                                    tint: .orange
                                )
                                experienceCard(
                                    title: "PRECISION PARKING",
                                    subtitle: "Spatial awareness, reversing, and controlled parking.",
                                    symbol: "parkingsign.circle.fill",
                                    tint: .mint
                                )
                            }

                            VStack(spacing: 16) {
                                experienceCard(
                                    title: "ROADside READY",
                                    subtitle: "Emergency tyre replacement and roadside safety.",
                                    symbol: "wrench.and.screwdriver.fill",
                                    tint: .orange
                                )
                                experienceCard(
                                    title: "PRECISION PARKING",
                                    subtitle: "Spatial awareness, reversing, and controlled parking.",
                                    symbol: "parkingsign.circle.fill",
                                    tint: .mint
                                )
                            }
                        }
                    }

                    Button {
                        isShowingPrototypeInfo = true
                    } label: {
                        Label("About the Prototype", systemImage: "info.circle.fill")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(red: 0.27, green: 0.70, blue: 0.91))
                    .controlSize(.large)
                    .accessibilityHint("Opens information about this foundation build")
                }
                .frame(maxWidth: 920, alignment: .leading)
                .padding(.horizontal, 28)
                .padding(.vertical, 36)
            }
        }
        .sheet(isPresented: $isShowingPrototypeInfo) {
            PrototypeInfoView()
        }
    }

    private var brandHeader: some View {
        VStack(alignment: .leading, spacing: 14) {
            Label("BEYOND SCHOOL", systemImage: "road.lanes")
                .font(.headline.weight(.semibold))
                .foregroundStyle(Color(red: 0.47, green: 0.83, blue: 0.98))

            Text("Real-world skills.\nPractised, not just explained.")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))
                .foregroundStyle(.white)
                .fixedSize(horizontal: false, vertical: true)

            Text("Interactive learning experiences designed to build calm, practical confidence for the road ahead.")
                .font(.title3)
                .foregroundStyle(.white.opacity(0.78))
                .fixedSize(horizontal: false, vertical: true)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Beyond School. Real-world skills. Practised, not just explained.")
    }

    private func experienceCard(title: String, subtitle: String, symbol: String, tint: Color) -> some View {
        VStack(alignment: .leading, spacing: 18) {
            Image(systemName: symbol)
                .font(.system(size: 30, weight: .semibold))
                .foregroundStyle(tint)
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 7) {
                Text(title)
                    .font(.title3.weight(.bold))
                    .foregroundStyle(.white)
                Text(subtitle)
                    .font(.body)
                    .foregroundStyle(.white.opacity(0.76))
                    .fixedSize(horizontal: false, vertical: true)
            }

            Label("In development", systemImage: "hammer.fill")
                .font(.caption.weight(.semibold))
                .foregroundStyle(.white.opacity(0.9))
                .padding(.horizontal, 10)
                .padding(.vertical, 6)
                .background(.white.opacity(0.14), in: Capsule())
        }
        .frame(maxWidth: .infinity, minHeight: 210, alignment: .leading)
        .padding(22)
        .background(.white.opacity(0.10), in: RoundedRectangle(cornerRadius: 24, style: .continuous))
        .overlay {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(.white.opacity(0.15), lineWidth: 1)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(title). \(subtitle) In development.")
    }
}

private struct PrototypeInfoView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Image(systemName: "flag.checkered.circle.fill")
                    .font(.system(size: 48))
                    .foregroundStyle(.blue)
                    .accessibilityHidden(true)

                Text("Foundation build")
                    .font(.title.bold())

                Text("This prototype establishes the visual and technical starting point for Beyond School 2.0. Interactive 3D learning experiences will be introduced in later stages after the native application foundation is validated.")
                    .font(.body)
                    .fixedSize(horizontal: false, vertical: true)

                Spacer()
            }
            .padding(28)
            .navigationTitle("About")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
        .presentationDetents([.medium])
    }
}

#Preview {
    WelcomeView()
}
