import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

class AudioRecorderApp extends StatefulWidget {
  const AudioRecorderApp({Key? key}) : super(key: key);

  @override
  _AudioRecorderAppState createState() => _AudioRecorderAppState();
}

class _AudioRecorderAppState extends State<AudioRecorderApp> {
  final AudioPlayer _audioPlayer = AudioPlayer(); // To play the recorded audio
  final AudioRecorder _audioRecorder = AudioRecorder(); // To record audio
  String? _audioPath; // Path to the recorded audio file
  bool _isRecording = false; // To track recording state

  // Start recording audio
  Future<void> _startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        // Start recording with a valid file path
        final tempDir = await getTemporaryDirectory();
        final filePath = '${tempDir.path}/audio.m4a';

        await _audioRecorder.start(const RecordConfig(), path: filePath);
        setState(() {
          _isRecording = true;
        });
        print('Recording started at: $filePath');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Microphone permission denied')),
        );
      }
    } catch (e) {
      print('Error starting recording: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error starting recording: $e')),
      );
    }
  }

  // Stop recording audio
  Future<void> _stopRecording() async {
    try {
      final path = await _audioRecorder.stop();
      setState(() {
        _isRecording = false;
        _audioPath = path;
      });
      print('Recording stopped. File saved at: $_audioPath');
    } catch (e) {
      print('Error stopping recording: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error stopping recording: $e')),
      );
    }
  }

  // Play the recorded audio
  Future<void> _playAudio() async {
    if (_audioPath != null) {
      try {
        await _audioPlayer.play(DeviceFileSource(_audioPath!));
        print('Playing audio from: $_audioPath');
      } catch (e) {
        print('Error playing audio: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error playing audio: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _audioRecorder.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Recorder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Live Recording UI
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // Recording Indicator
                  if (_isRecording)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.mic,
                          color: Colors.red,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Recording...',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),



                  // Start/Stop Button
                  GestureDetector(
                    onTap: _isRecording ? _stopRecording : _startRecording,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: _isRecording ? Colors.red : Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _isRecording ? Icons.stop : Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Play Audio Button (only visible if audio is recorded)
            if (_audioPath != null)
              ElevatedButton(
                onPressed: _playAudio,
                child: const Text('Play Audio'),
              ),
          ],
        ),
      ),
    );
  }
}

