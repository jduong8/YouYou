//
//  AudioRecordManager.swift
//  YouYou
//
//  Created by Jonathan Duong on 23/03/2021.
//

import AVFoundation
import Combine

class AudioRecorderManager: NSObject, ObservableObject {
    //Implemented by subclasses to initialize a new object (the receiver) immediately after memory for it has been allocated...
    override init() {
        super.init()
        refreshRecordings()
    }
    
    //A publisher that emits before the object has changed...
    let objectWillChange = PassthroughSubject<AudioRecorderManager, Never>()//A subject that broadcasts elements to downstream subscribers...
    //pour suivre un enregistrement individuel...
    var audioRecorder: AVAudioRecorder!//A class that provides audio recording capability in your application...
    
    var recordings = [Recording]()
    
    var recording: Bool = false {
        didSet {
            objectWillChange.send(self)
        }
    }

    func startRecording() {
        //pour activer et suivre l'enregistrement sonore dans son ensemble...
        let recordingSession = AVAudioSession.sharedInstance()//Returns the shared audio session instance...
        //A file manager object lets you examine the contents of the file system and make changes to it...
        let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        //Returns a URL constructed by appending the given path component to self...
        let audioFilename = documentPath.appendingPathComponent("\(Date().toString(dateFormat: "dd-MM-YY_'at'_HH:mm:ss")).m4a")
        
        //On définit le type de session d'enregistrement et l'active. Si échec, nous afficherons une erreur...
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .default)
            try recordingSession.setActive(true)
        } catch {
            //Failed to set up recording session
            print("Error")
        }
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.record()
            
            recording = true
        } catch {
            //Could not start recording
            print("Error")
        }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        recording = false
        refreshRecordings()
    }
    //A collection of unique integer values that represent the indexes of elements in another collection...
    func removeRecording(at offsets: IndexSet) {
        //le file manager va permettre d'accéder aux fichiers
        let fileManager = FileManager.default
        
        for index in offsets {
            let result = recordings[index]
            //Removes the file or directory at the specified URL...
            try! fileManager.removeItem(at: result.fileURL)
        }
        refreshRecordings()
    }
    
    func refreshRecordings() {
        recordings.removeAll()
        recordings = fetchRecording()
        objectWillChange.send(self)
    }
    
    func fetchRecording() -> [Recording] {
        
        var recordings: [Recording] = []
        let fileManager = FileManager.default
        //sauvegarde interne de fichiers...
        //Then we specify the location where the recording should be saved...
        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
        
        for audio in directoryContents {
            let recording = Recording(fileURL: audio, createdAt: getCreationDate(for: audio), user: PROFILS)
            recordings.append(recording)
        }
        recordings.sort(by: { $0.createdAt.compare($1.createdAt) == .orderedAscending})
        
        return recordings
    }
}
