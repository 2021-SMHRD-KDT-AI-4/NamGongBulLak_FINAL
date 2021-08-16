// 사용자에게 카메라 화면의 데이터를 요청
const constraints = {audio: false, video: true};

navigator.mediaDevices.getUserMedia(constraints)
  .then(function(mediaStream){
    // 비디오 트랙을 포함한 MediaStream
    console.log(mediaStream);
  })