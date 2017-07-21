//
//  TextTaskCreationScreenTextTaskCreationScreenViewOutput.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

protocol TextTaskCreationScreenViewOutput {

    func setDataIfExist() -> HeaderText?
    
    func createEntityAndPush(_ headerText: String, _ text: String)

    func viewIsReady()
}
