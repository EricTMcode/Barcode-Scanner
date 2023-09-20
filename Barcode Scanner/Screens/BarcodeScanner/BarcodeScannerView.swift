//
//  BarcodeScannerView.swift
//  Barcode Scanner
//
//  Created by Eric on 19/09/2023.
//

import SwiftUI



struct BarcodeScannerView: View {
    
    @StateObject var vm = BarcodeScannerViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScannerView(scannedCode: $vm.scannedCode, alertItem: $vm.alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer()
                    .frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(vm.statusText)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(vm.statusTextColor)
                    .padding()
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $vm.alertItem) { alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismiss)
                
            }
        }
    }
}

#Preview {
    BarcodeScannerView()
}
