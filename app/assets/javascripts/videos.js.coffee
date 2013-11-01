$ ->
  recorder = undefined
  mediaStream = undefined
  webOn = $('#on-webcam')
  webOff = $('#off-webcam')
  start = $('#start-record')
  stop = $('#stop-record')
  save = $('#save-record')
  video = $('#video')

  webOn.click ->
    @disabled = true
    webOff.removeAttr('disabled')
    start.removeAttr('disabled')
    navigator.getUserMedia {audio: true, video: true}, ((stream) ->
      video.attr('src', URL.createObjectURL(stream))
      mediaStream = stream
      ), ->
        @disabled = false
        webOff.attr('disabled', 'disabled')
        alert 'Webcam access is denied.'

  webOff.click ->
    @disabled = true
    webOn.removeAttr('disabled')
    mediaStream.stop()


  start.click ->
    video.attr('src', URL.createObjectURL(mediaStream))
    recorder = window.RecordRTC(mediaStream, {type: 'video'})
    recorder.startRecording()
    # window.isAudio = false
    @disabled = true
    stop.removeAttr('disabled')

  stop.click ->
    @disabled = true
    start.removeAttr('disabled')
    save.removeAttr('disabled')
    if recorder
      recorder.stopRecording (url) ->
        video.attr('src', url)

  save.click ->
    if recorder
      formData = new FormData()
      formData.append('video-filename', 'video.webm')
      formData.append('video-blob', recorder.getBlob())

    $.ajax url: video.data('url'), type: 'POST', data: formData, contentType: false, processData: false, cache: false, dataType: 'script'
