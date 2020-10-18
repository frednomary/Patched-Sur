//
//  ContentView.swift
//  Patched Sur - For Catalina
//
//  Created by Benjamin Sova on 9/23/20.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            AllViews()
        }
        .frame(minWidth: 500, maxWidth: 500, minHeight: 300, maxHeight: 300)
        .background(colorScheme == .dark ? Color.black : Color.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AllViews : View {
    @State var progress = 0
    @State var password = ""
    @State var volume = ""
    @State var overrideinstaller = false
    @State var releaseTrack = ReleaseTrack.publicbeta
    @State var installMethod = InstallMethod.update
    var body: some View {
        if progress == 0 {
            MainView(p: $progress)
        } else if progress == 1 {
            MacCompatibility(p: $progress)
        } else if progress == 2 {
            HowItWorks(p: $progress)
        } else if progress == 9 {
            ReleaseTrackView(track: $releaseTrack, p: $progress)
        } else if progress == 10 {
            InstallMethodView(method: $installMethod, p: $progress)
        } else if progress == 3 {
            DownloadView(p: $progress)
        } else if progress == 4 {
            InstallPackageView(password: $password, p: $progress, overrideInstaller: $overrideinstaller, track: $releaseTrack)
        } else if progress == 5 {
            VolumeSelector(p: $progress, volume: $volume)
        } else if progress == 6 {
            ConfirmVolumeView(volume: $volume, p: $progress)
        } else if progress == 7 {
            CreateInstallMedia(volume: $volume, password: $password, overrideInstaller: $overrideinstaller)
        }
    }
}

enum ReleaseTrack {
    case release
    case publicbeta
    case developer
}
