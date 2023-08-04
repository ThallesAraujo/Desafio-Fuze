//
//  ViewModel.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 02/08/23.
//

import Foundation
import SwiftUI
import RxSwift
import RxCocoa

class ViewModel{
    
    @Published var isLoading: Bool = true
    @Published var showError: Bool = false
    @Published var isNetworkError: Bool = false
    @Published var errorString: String = ""
    var completion: (() -> Void)?  = {}
    
    private let disposeBag = DisposeBag()
    
    internal func perform<T:Decodable>(_ type: T.Type, request: URLRequest, successCompletion: @escaping (T) -> Void){
    
        isLoading = true
        
        guard NetworkTester().isConnected() else {
            errorProcedure(isNetworkError: true)
            return
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        URLSession.shared.rx.response(request: request)
            .map { response, data in
                try decoder.decode(type.self, from: data)
            }.observe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] response in
                self?.isLoading = false
                successCompletion(response)
            }, onError: { [weak self] error in
                if let unitTesting = self?.isRunningUnitTests(), !unitTesting {
                    self?.errorString = error.localizedDescription
                    self?.errorProcedure()
                }
                print("Error:\(error.localizedDescription)")
            }).disposed(by: disposeBag)
        
    }
    
    internal func errorProcedure(isNetworkError: Bool = false){
        self.showError = true
        self.isLoading = false
        self.isNetworkError = isNetworkError
        if let completion = self.completion {completion()}
    }
    
    fileprivate func isRunningUnitTests() -> Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
}

