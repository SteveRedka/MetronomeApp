class window.Audio

  @initializeSound_onFinishedLoading: (finishedLoadingFunction) ->
    @finishedLoadingFunction = finishedLoadingFunction

    try # Fix up for prefixing
      window.AudioContext = window.AudioContext||window.webkitAudioContext
      window.context = new AudioContext()
    catch
      alert('Web Audio API is not supported in this browser')

    tones = [
      '/assets/sounds/tone_700hz.mp3',
      '/assets/sounds/tone_800hz.mp3',
      '/assets/sounds/tone_850hz.mp3',
      '/assets/sounds/tone_900hz.mp3',
      '/assets/sounds/tone_950hz.mp3',
      '/assets/sounds/tone_1000hz.mp3',
      '/assets/sounds/tone_1050hz.mp3',
      '/assets/sounds/tone_1100hz.mp3',
      '/assets/sounds/tone_1150hz.mp3',
      '/assets/sounds/tone_1200hz.mp3',
      '/assets/sounds/tone_1250hz.mp3',
      '/assets/sounds/tone_1300hz.mp3',
      '/assets/sounds/tone_1350hz.mp3',
      '/assets/sounds/tone_1400hz.mp3',
      '/assets/sounds/tone_1450hz.mp3',
      '/assets/sounds/tone_1500hz.mp3',
      '/assets/sounds/tone_2000hz.mp3',
      '/assets/sounds/tone_2500hz.mp3',
      '/assets/sounds/tone_3000hz.mp3',
      '/assets/sounds/tone_3500hz.mp3',
      '/assets/sounds/tone_4000hz.mp3',
      '/assets/sounds/tone_Silence_1ms.wav']
    bufferLoader = new BufferLoader(context, tones, @finishedLoading)
    bufferLoader.load()

  @finishedLoading: (buffers) =>
    @assignTones(buffers)
    @finishedLoadingFunction?.apply()

  @assignTones: (buffers) ->
    @tone_700hz = buffers[0]
    @tone_800hz = buffers[1]
    @tone_850hz = buffers[2]
    @tone_900hz = buffers[3]
    @tone_950hz = buffers[4]
    @tone_1000hz = buffers[5]
    @tone_1050hz = buffers[6]
    @tone_1100hz = buffers[7]
    @tone_1150hz = buffers[8]
    @tone_1200hz = buffers[9]
    @tone_1250hz = buffers[10]
    @tone_1300hz = buffers[11]
    @tone_1350hz = buffers[12]
    @tone_1400hz = buffers[13]
    @tone_1450hz = buffers[14]
    @tone_1500hz = buffers[15]
    @tone_2000hz = buffers[16]
    @tone_2500hz = buffers[17]
    @tone_3000hz = buffers[18]
    @tone_3500hz = buffers[19]
    @tone_4000hz = buffers[20]
    @tone_Silent_1ms = buffers[21]

  @startBufferAtTimeAtPosition: (buffer, time, vector) ->
    source = context.createBufferSource()
    panner = context.createPanner()
    source.buffer = buffer
    panner.setPosition(vector[0], vector[1], vector[2])
    panner.connect(context.destination)
    source.connect(panner)
    source.start(time)
    source

  @startBufferAtTime: (buffer, time) ->
    source = context.createBufferSource()
    source.buffer = buffer
    source.connect(context.destination);
    source.start(time)
    source

  @startSound_Right: (buffer, time) ->
    @startBufferAtTimeAtPosition(buffer, time, [+1,0,0])

  @startSound_Center: (buffer, time) ->
    @startBufferAtTimeAtPosition(buffer, time, [0,0,0])

  @startSound_Left: (buffer, time) ->
    @startBufferAtTimeAtPosition(buffer, time, [-1,0,0])

  @startSound: (buffer, time) ->
    @startSound_Center(buffer, time)



